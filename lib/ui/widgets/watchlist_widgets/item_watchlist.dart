import 'dart:math';

import 'package:flutter/material.dart';
import 'package:market_wiz_flutter/common/text_themes.dart';
import 'package:market_wiz_flutter/common/utils.dart';
import 'package:market_wiz_flutter/data/database/database.dart';

class ItemWatchlist extends StatelessWidget {
  const ItemWatchlist({Key key, this.itemData}) : super(key: key);

  final WatchlistItemData itemData;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: getCardColor(itemData.netChange),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${itemData.symbol}',
                    style: TextThemes.indexCardMain(context),
                  ),
                  Text(
                    '${doubleToPVString(itemData.netChange)}\$ (${doubleToPVString(itemData.percentageChange)}%)',
                    style: TextThemes.indexCardSmall(context),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${roundDouble(itemData.lastPrice, 2)}',
                    style: TextThemes.indexCardBig(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
