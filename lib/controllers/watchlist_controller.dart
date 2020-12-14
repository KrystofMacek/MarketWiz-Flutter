import 'package:flutter_riverpod/all.dart';
import 'package:market_wiz_flutter/data/database/database.dart';
import 'package:market_wiz_flutter/data/repository.dart';

final watchlistProvider = StateNotifierProvider<WatchlistProvider>((ref) {
  return WatchlistProvider(ref.watch(repositoryProvider));
});

class WatchlistProvider extends StateNotifier<AsyncValue<WatchlistItemData>> {
  WatchlistProvider(this._repository, [AsyncValue<WatchlistProvider> state])
      : super(state ?? AsyncValue.data(null));

  final MarketDataRepository _repository;

  Stream<List<WatchlistItemData>> getWatchlist() =>
      _repository.watchWatchlistItems();

  void updateWatchlist() => _repository.updateWatchlist();

  void removeFromWatchlist(WatchlistItemData item) =>
      _repository.removeFromWatchlist(item);
}
