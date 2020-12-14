import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:market_wiz_flutter/common/utils.dart';
import 'package:market_wiz_flutter/controllers/details_controller.dart';
import 'package:market_wiz_flutter/data/database/database.dart';
import 'trade_dialog.dart';
import '../../../common/text_themes.dart';

class DetailsActions extends StatelessWidget {
  const DetailsActions({
    Key key,
    this.details,
    this.controller,
  }) : super(key: key);

  final StockDataDetail details;
  final StockDetailsProvider controller;

  @override
  Widget build(BuildContext context) {
    bool active = details.records.historyRecords.length > 1;
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () {
              if (active) {
                controller.addToWatchlist(
                  WatchlistItemData(
                      symbol: details.symbol.toUpperCase(),
                      name: details.symbol,
                      lastPrice: roundDouble(
                          details.records.historyRecords.last.close, 2),
                      netChange: 0,
                      percentageChange: 0),
                );
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Theme.of(context).primaryColor,
                    content: Text(
                      'Added to Watchlist',
                      style: TextThemes.indexCardSmall(context),
                    ),
                  ),
                );
              }
            },
            child: Icon(
              Icons.star_border_outlined,
            ),
            color: Theme.of(context).accentColor,
          ),
          MaterialButton(
            minWidth: 150,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            onPressed: () {
              // show dialog to create Position
              if (active) {
                showDialog(
                  context: context,
                  builder: (_) => TradeDialog(
                    symbol: details.symbol,
                    lastPrice: details.records.historyRecords.last.close,
                  ),
                );
              }
            },
            child: Text(
              'TRADE',
              style: TextThemes.primaryButtonStyle(context),
            ),
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
