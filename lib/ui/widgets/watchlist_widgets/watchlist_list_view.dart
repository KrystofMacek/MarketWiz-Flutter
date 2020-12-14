import 'package:flutter/material.dart';
import 'package:market_wiz_flutter/controllers/watchlist_controller.dart';
import 'package:market_wiz_flutter/data/database/database.dart';
import './item_watchlist.dart';

class WatchlistListView extends StatelessWidget {
  const WatchlistListView({
    Key key,
    this.watchlist,
    this.controller,
  }) : super(key: key);

  final List<WatchlistItemData> watchlist;
  final WatchlistProvider controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 40, left: 10, right: 10),
        child: ListView.separated(
          itemCount: watchlist.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(
            indent: 20,
          ),
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(watchlist[index].symbol),
              onDismissed: (direction) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        "${watchlist[index].symbol} removed from watchlist."),
                  ),
                );
                controller.removeFromWatchlist(watchlist[index]);
              },
              child: ItemWatchlist(
                itemData: watchlist[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
