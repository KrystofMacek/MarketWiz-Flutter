import 'package:flutter_riverpod/all.dart';
import 'package:market_wiz_flutter/data/database/database.dart';
import 'package:market_wiz_flutter/data/database/models/quote_history.dart';

import '../models/database_models.dart';
import 'package:moor/moor.dart';
part 'dao.g.dart';

final daoProvider = Provider((ref) {
  print('Local Database provider');
  final db = ref.watch(databaseProvider);

  return MarketDataDao(db);
});

@UseDao(tables: [
  MarketIndex,
  QuoteHistory,
  WatchlistItem,
  PositionItem,
  StockDataDetails,
  Portfolio,
])
class MarketDataDao extends DatabaseAccessor<LocalDatabase>
    with _$MarketDataDaoMixin {
  MarketDataDao(LocalDatabase db) : super(db);

  Stream<List<WatchlistItemData>> watchWatchlistItems() =>
      select(watchlistItem).watch();

  Stream<List<PositionItemData>> watchPortfolioPositions() =>
      select(positionItem).watch();
  Future<List<PositionItemData>> getPortfolioPositions() =>
      select(positionItem).get();

  Stream<List<MarketIndexData>> watchMarketIndices() =>
      select(marketIndex).watch();

  Stream<StockDataDetail> watchDetails() =>
      select(stockDataDetails).watchSingle();

  Stream<QuoteHistoryData> watchQuoteHitoryT(String symbol) =>
      select(quoteHistory)
          .watchSingle()
          .where((historyRecord) => historyRecord.symbol == symbol);

  Stream<QuoteHistoryData> watchQuoteHitory(String symbol) {
    return (select(quoteHistory)..where((tbl) => tbl.symbol.equals(symbol)))
        .watchSingle();
  }

  Stream<PortfolioData> watchPortfolio() => select(portfolio).watchSingle();

  // ************

  Future insertMarketIndex(MarketIndexData marketIndexEntry) =>
      into(marketIndex).insertOnConflictUpdate(marketIndexEntry);

  // ****** WATCHLIST ****** //
  Future inserWatchlistItem(WatchlistItemData watchlistItemData) =>
      into(watchlistItem).insertOnConflictUpdate(watchlistItemData);

  Future updateWatchlistItem(WatchlistItemData watchlistItemData) =>
      update(watchlistItem).replace(watchlistItemData);

  Future deleteWatchlistItem(WatchlistItemData watchlistItemData) =>
      delete(watchlistItem).delete(watchlistItemData);

  Future<List<WatchlistItemData>> getWatchlist() => select(watchlistItem).get();

  // ****** PORTFOLIO ****** //
  Future inserPositionItem(PositionItemCompanion positionItemData) =>
      into(positionItem).insert(positionItemData);

  Future updatePositionItem(PositionItemData positionItemData) =>
      update(positionItem).replace(positionItemData);

  Future deletePositionItem(PositionItemData positionItemData) =>
      delete(positionItem).delete(positionItemData);

  Future initPortfolio(PortfolioCompanion portfolioData) {
    delete(portfolio).go();
    return into(portfolio).insert(portfolioData);
  }

  Future updatePortfolio(PortfolioData portfolioData) =>
      update(portfolio).replace(portfolioData);

  // ****** DETAILS ****** //

  Future insertStockDataDetails(StockDataDetail detailData) {
    delete(stockDataDetails).go();
    return into(stockDataDetails).insertOnConflictUpdate(detailData);
  }

  // ****** HISTORY ****** //
  Future insertQuoteHistory(QuoteHistoryData quoteHistoryEntry) =>
      into(quoteHistory).insertOnConflictUpdate(quoteHistoryEntry);
}
