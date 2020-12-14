import 'package:flutter_riverpod/all.dart';
import 'package:market_wiz_flutter/data/database/database.dart';
import 'package:market_wiz_flutter/data/repository.dart';

// *********** MARKET DATA *********** //
final marketDataNotifierProvider =
    StateNotifierProvider<MarketDataProvider>((ref) {
  final _repository = ref.watch(repositoryProvider);
  return MarketDataProvider(_repository);
});

class MarketDataProvider
    extends StateNotifier<AsyncValue<List<MarketIndexData>>> {
  MarketDataProvider(this._repository,
      [AsyncValue<List<MarketIndexData>> state])
      : super(state ?? AsyncValue.data(null));

  final MarketDataRepository _repository;

  Stream<List<MarketIndexData>> indicesData() =>
      _repository.watchMarketIndices();

  void loadIndices() {
    _repository.getIndices();
  }
}

// *********** HISTORY - CHART DATA *********** //
final historyDataNotifierProvider =
    StateNotifierProvider<HistoryDataProvider>((ref) {
  final _repository = ref.watch(repositoryProvider);
  return HistoryDataProvider(_repository);
});

class HistoryDataProvider
    extends StateNotifier<AsyncValue<List<MarketIndexData>>> {
  HistoryDataProvider(this._repository,
      [AsyncValue<List<MarketIndexData>> state])
      : super(state ?? AsyncValue.data(null));

  final MarketDataRepository _repository;

  Stream<QuoteHistoryData> getHistory(String symbol) =>
      _repository.watchQuoteHistory(symbol);
}

// *********** SELECT INDEX *********** //
final selectedIndexNotifierProvider =
    StateNotifierProvider<SelectedIndexNotifier>((ref) {
  return SelectedIndexNotifier();
});

class SelectedIndexNotifier extends StateNotifier<int> {
  SelectedIndexNotifier() : super(0);

  void selectIndex(int index) {
    print(state);
    state = index;
  }
}
