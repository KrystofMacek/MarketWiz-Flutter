import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:market_wiz_flutter/controllers/watchlist_controller.dart';
import 'package:market_wiz_flutter/data/database/database.dart';
import '../widgets/watchlist_widgets/watchlist_widgets.dart';

class WatchlistPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final WatchlistProvider watchlist = watch(watchlistProvider);
    final connectivity = Connectivity();

    return Scaffold(
      body: Container(
        child: StreamBuilder<bool>(
            stream: connectivity.isConnected,
            initialData: false,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data) {
                  watchlist.updateWatchlist();
                }
                return Column(
                  children: [
                    StreamBuilder<List<WatchlistItemData>>(
                      stream: watchlist.getWatchlist(),
                      initialData: [],
                      builder: (context, snapshot) {
                        return WatchlistListView(
                          watchlist: snapshot.data,
                          controller: watchlist,
                        );
                      },
                    ),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
