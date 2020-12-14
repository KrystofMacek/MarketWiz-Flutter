import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:market_wiz_flutter/common/constants.dart';
import 'package:market_wiz_flutter/common/market_indices_list_generator.dart';
import 'package:market_wiz_flutter/common/utils.dart';
import 'package:market_wiz_flutter/data/database/dao/dao.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:market_wiz_flutter/data/database/database.dart';
import 'package:market_wiz_flutter/data/database/models/database_models.dart';
import 'package:market_wiz_flutter/data/database/models/quote_history.dart';
import 'package:market_wiz_flutter/data/network/api/market_data_service.dart';
import 'package:market_wiz_flutter/data/network/api/stock_data_service.dart';
import 'package:market_wiz_flutter/data/network/models/quote_history_result.dart';
import 'package:market_wiz_flutter/data/network/models/stock_data_result.dart';

final repositoryProvider = Provider((ref) {
  final dao = ref.watch(daoProvider);
  final marketDataService = ref.watch(marketDataServiceProvider);
  final historyService = ref.watch(historyDataServiceProvider);
  final stockDataService = ref.watch(stockDataServiceProvider);
  final quoteService = ref.watch(quoteServiceProvider);

  return MarketDataRepository(
    dao: dao,
    marketDataService: marketDataService,
    historyDataService: historyService,
    stockDataService: stockDataService,
    quoteService: quoteService,
  );
});

class MarketDataRepository {
  final MarketDataDao dao;
  final MarketDataService marketDataService;
  final HistoryDataService historyDataService;
  final StockDataService stockDataService;
  final QuoteService quoteService;

  MarketDataRepository({
    this.dao,
    this.marketDataService,
    this.historyDataService,
    this.stockDataService,
    this.quoteService,
  });

  // DATABASE
  Stream<List<MarketIndexData>> watchMarketIndices() =>
      dao.watchMarketIndices();

  Stream<QuoteHistoryData> watchQuoteHistory(String symbol) =>
      dao.watchQuoteHitory(symbol);

  Stream<StockDataDetail> watchStockDataDetail() => dao.watchDetails();

  Stream<List<PositionItemData>> watchPortfolioPositions() =>
      dao.watchPortfolioPositions();

  Stream<PortfolioData> watchPortfolio() => dao.watchPortfolio();

  // Portfolio
  Future initPortfolio() => dao.initPortfolio(
        PortfolioCompanion.insert(openPositionsPL: 0.0, closedPositionsPL: 0.0),
      );

  Future updatePortfolio(
      PortfolioData portfolio, double currentPLchange, double totalPLchange) {
    return dao.updatePortfolio(
      portfolio.copyWith(
        closedPositionsPL: totalPLchange,
        openPositionsPL: currentPLchange,
      ),
    );
  }

  Future removePosition(PositionItemData item) => dao.deletePositionItem(item);

  // watchlist
  Stream<List<WatchlistItemData>> watchWatchlistItems() =>
      dao.watchWatchlistItems();

  Future addToWatchlist(WatchlistItemData item) => dao.inserWatchlistItem(item);

  Future removeFromWatchlist(WatchlistItemData item) =>
      dao.deleteWatchlistItem(item);

  // WatchlistUpdate
  void updateWatchlist() async {
    final List<WatchlistItemData> watchlist = await dao.getWatchlist();

    for (var item in watchlist) {
      // get last price "quote call"
      final result =
          await quoteService.getQuote(item.symbol, SD_API_KEY_SANDBOX);
      final quote = result.body;
      final netChange = roundDouble(quote.c - quote.pc, 2);
      final percentageChange = roundDouble(netChange / quote.pc, 2);

      double newLastPrice = result.body.l;
      WatchlistItemData updatedItem = item.copyWith(
          lastPrice: newLastPrice,
          netChange: netChange,
          percentageChange: percentageChange);
      dao.updateWatchlistItem(updatedItem);
    }
  }

  // Positions
  void updatePortfolioItems() async {
    final List<PositionItemData> portfolioPositions =
        await dao.getPortfolioPositions();

    for (var item in portfolioPositions) {
      final result =
          await quoteService.getQuote(item.symbol, SD_API_KEY_SANDBOX);

      double newLastPrice = result.body.l;
      PositionItemData updatedItem = item.copyWith(lastPrice: newLastPrice);
      dao.updatePositionItem(updatedItem);
    }
  }

  // API
  void getDetailsFor(String symbol) async {
    final now = (DateTime.now().millisecondsSinceEpoch / 1000).round();
    final from = now - (MONTH_IN_SECONDS * 12);
    Response<StockDataResult> response;
    try {
      response = await stockDataService.getStockData(
          symbol, 'D', from.toString(), now.toString(), SD_API_KEY_SANDBOX);
    } catch (e) {
      print(e);
    }

    if (response != null && response.isSuccessful && response.body.s == 'ok') {
      final data = response.body;
      final numOfEntries = data.c.length;

      StockDataRecords dataRecords = StockDataRecords(historyRecords: []);
      for (var i = 0; i < numOfEntries - 1; i++) {
        StockDataRecord record = StockDataRecord(
          close: data.c[i],
          open: data.o[i],
          high: data.h[i],
          low: data.l[i],
          volume: data.v[i],
          timestamp: data.t[i],
        );
        dataRecords.historyRecords.add(record);
      }

      StockDataDetail stockData =
          StockDataDetail(symbol: symbol, records: dataRecords);
      dao.insertStockDataDetails(stockData);
    } else {
      StockDataDetail stockData = StockDataDetail(
          symbol: symbol, records: StockDataRecords(historyRecords: []));
      dao.insertStockDataDetails(stockData);
    }
  }

  void getIndices() async {
    print('get Indices Called');

    final response = await marketDataService.getMarketIndicesData(
      IndicesGenerator.generateList(),
      MARKET_INDEX_FIELDS,
    );
    if (response.isSuccessful &&
        response.body.status.code == 200 &&
        response.body.results.isNotEmpty) {
      for (var index in response.body.results) {
        MarketIndexData marketIndexData = MarketIndexData(
          symbol: index.symbol,
          name: index.name,
          lastPrice: index.lastPrice,
          netChange: index.netChange,
          percentageChange: index.percentChange,
          fiftyTwoWeekHigh: index.fiftyTwoWkHigh.toDouble(),
          fiftyTwoWeekLow: index.fiftyTwoWkLow.toDouble(),
          volume: index.volume,
          exchange: index.exchange,
        );
        this.getHistory(index.symbol);
        dao.insertMarketIndex(marketIndexData);
      }
    }
  }

  void getHistory(String symbol) async {
    Response<HistoryResult> response;
    try {
      response = await historyDataService.getQuotesHistory(
          symbol, HISTORY_TYPE, '20200101', getEndDate(), HISTORY_ORDER);
    } catch (e) {
      print('response $response');
      print(e);
    }

    if (response != null &&
        response.body.status.code == 200 &&
        response.body.results.isNotEmpty) {
      HistoryRecords historyRecords = HistoryRecords(historyRecords: []);
      for (var item in response.body.results) {
        Record record = Record(
            open: item.open, close: item.close, high: item.high, low: item.low);
        historyRecords.historyRecords.add(record);
      }

      QuoteHistoryData quoteHistoryData =
          QuoteHistoryData(symbol: symbol, records: historyRecords);
      dao.insertQuoteHistory(quoteHistoryData);
    }
  }

  // Positions
  void createPosition(
    String symbol,
    String name,
    double lastPrice,
    double entryPrice,
    int size,
    int positionType,
  ) {
    print(
        'CREATE POSITION $symbol, $name, $lastPrice, $entryPrice, $size, $positionType');

    final PositionItemCompanion position = PositionItemCompanion.insert(
        symbol: symbol,
        name: name,
        lastPrice: lastPrice,
        entryPrice: entryPrice,
        size: size,
        positionType: positionType);

    dao.inserPositionItem(position);
  }
}
