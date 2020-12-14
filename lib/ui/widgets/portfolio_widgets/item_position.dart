import 'dart:math';

import 'package:flutter/material.dart';
import 'package:market_wiz_flutter/common/constants.dart';
import 'package:market_wiz_flutter/common/text_themes.dart';
import 'package:market_wiz_flutter/data/database/database.dart';
import '../../../common/utils.dart';

class ItemPosition extends StatelessWidget {
  const ItemPosition({Key key, this.item}) : super(key: key);

  final PositionItemData item;

  @override
  Widget build(BuildContext context) {
    double _netPL = roundDouble(getNetPl(item), 2);
    double _percentageChange =
        roundDouble(_netPL / (item.size * item.entryPrice), 2);

    return Card(
      color: getCardColor(_netPL),
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
                    '${item.symbol}',
                    style: TextThemes.indexCardMain(context),
                  ),
                  Text(
                    '${doubleToPVString(_netPL)}\$ (${doubleToPVString(_percentageChange)}%)',
                    style: TextThemes.indexCardSmall(context),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _positionChar(item),
                    style: TextThemes.indexCardSmall(context),
                  ),
                  Text(
                    '${roundDouble(item.lastPrice, 2)}',
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

  String _positionChar(PositionItemData item) {
    if (item.positionType == POSITION_TYPE_LONG) {
      return 'Long (${item.size})';
    } else {
      return 'Short (${item.size})';
    }
  }
}
