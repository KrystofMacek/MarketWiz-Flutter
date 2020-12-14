import 'package:flutter_riverpod/all.dart';
import 'package:market_wiz_flutter/controllers/portfolio_controller.dart';
import 'package:market_wiz_flutter/data/database/database.dart';
import 'package:market_wiz_flutter/data/repository.dart';

final stockDataDetailsProvider =
    StateNotifierProvider<StockDetailsProvider>((ref) {
  final _repository = ref.watch(repositoryProvider);
  return StockDetailsProvider(_repository);
});

class StockDetailsProvider extends StateNotifier<AsyncValue<StockDataDetail>> {
  StockDetailsProvider(this._repository,
      [AsyncValue<StockDetailsProvider> state])
      : super(state ?? AsyncValue.data(null));

  final MarketDataRepository _repository;

  void getDetails(String symbol) => _repository.getDetailsFor(symbol);

  void addToWatchlist(WatchlistItemData item) =>
      _repository.addToWatchlist(item);

  Stream<StockDataDetail> watchDetail() => _repository.watchStockDataDetail();
}

final tradeDialogProvider = StateNotifierProvider<TradeDialogProvider>((ref) {
  final _repository = ref.watch(repositoryProvider);
  final _portfolio = ref.watch(portfolioController);
  return TradeDialogProvider(_repository);
});

class TradeDialogProvider extends StateNotifier<AsyncValue<PositionItemData>> {
  TradeDialogProvider(this._repository,
      [AsyncValue<StockDetailsProvider> state])
      : super(state ?? AsyncValue.data(null));

  final MarketDataRepository _repository;

  PositionItemData data;

  void editData(
    String symbol,
    String name,
    double lastPrice,
    double entryPrice,
    int size,
    int positionType,
  ) {
    data = PositionItemData(
      id: null,
      symbol: symbol,
      name: name,
      lastPrice: lastPrice,
      entryPrice: entryPrice,
      size: size,
      positionType: positionType,
    );
  }

  void createPosition() {
    _repository.createPosition(data.symbol, data.name, data.lastPrice,
        data.entryPrice, data.size, data.positionType);
  }
}

final numberOfSharesNotifierProvider =
    StateNotifierProvider<NumberOfShareNotifier>((ref) {
  return NumberOfShareNotifier();
});

class NumberOfShareNotifier extends StateNotifier<int> {
  NumberOfShareNotifier() : super(0);

  void inputNumber(int n) {
    print(state);
    state = n;
  }

  void clear() => state = 0;
}
