import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:market_wiz_flutter/common/constants.dart';
import 'package:market_wiz_flutter/data/database/database.dart';

Color getCardColor(double d) {
  if (d >= 0) {
    return Colors.green;
  } else {
    return Colors.red;
  }
}

Color getChartColor(double first, double last) {
  if (first <= last) {
    return Colors.green;
  } else {
    return Colors.red;
  }
}

String getEndDate() {
  return DateFormat('yyyyMMdd').format(DateTime.now());
}

double roundDouble(double val, int places) {
  double mod = pow(10.0, places);
  return ((val * mod).round().toDouble() / mod);
}

String doubleToPVString(double d) {
  if (d >= 0) {
    return '+$d';
  } else {
    return '$d';
  }
}

double getNetPl(PositionItemData item) {
  double _netPL = item.size * (item.lastPrice - item.entryPrice);
  if (item.positionType == POSITION_TYPE_SHORT && _netPL != 0) {
    _netPL = _netPL * -1;
  }

  return _netPL;
}
