import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:market_wiz_flutter/controllers/overview_controller.dart';
import 'package:market_wiz_flutter/data/database/database.dart';
import 'package:market_wiz_flutter/data/database/models/database_models.dart';

class OverviewChart extends ConsumerWidget {
  const OverviewChart({this.data, Key key}) : super(key: key);
  final List<MarketIndexData> data;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final selectedIndex = watch(selectedIndexNotifierProvider.state);
    final chartDataProvider = watch(historyDataNotifierProvider);

    print("CHART BUILD");

    return StreamBuilder<QuoteHistoryData>(
        stream: chartDataProvider.getHistory(data[selectedIndex].symbol),
        builder: (context, snapshot) {
          return Expanded(
            child: Container(
              width: double.infinity,
              child: LineChart(
                _buildChartData(snapshot.data.records.historyRecords),
              ),
            ),
          );
        });
  }
}

LineChartData _buildChartData(List<Record> records) {
  double maxY = 0;
  double minY = 0;
  double length = 0;

  List<LineChartBarData> data;

  if (records.isNotEmpty) {
    length = records.length.toDouble();
    maxY = records[0].close;
    minY = records[0].close;
    List<FlSpot> spots = [];

    records.asMap().forEach((index, value) {
      if (value.close > maxY) {
        maxY = value.close;
      } else if (value.close < minY) {
        minY = value.close;
      }
      FlSpot entry = FlSpot(index.toDouble(), value.close);
      spots.add(entry);
    });

    data = _buildBarData(spots);
  }

  return LineChartData(
    clipData: FlClipData(top: true, bottom: true, left: true, right: true),
    gridData: FlGridData(
      show: false,
    ),
    titlesData: FlTitlesData(
      bottomTitles: SideTitles(
        showTitles: false,
      ),
      rightTitles: SideTitles(
        showTitles: false,
      ),
      leftTitles: SideTitles(
        showTitles: false,
      ),
    ),
    borderData: FlBorderData(show: false),
    minX: 0,
    maxX: length,
    maxY: maxY + (0.02 * maxY),
    minY: minY - (0.02 * minY),
    lineBarsData: data,
  );
}

List<LineChartBarData> _buildBarData(List<FlSpot> spots) {
  Color _color = _getCardColor();

  final LineChartBarData lineChartBarData = LineChartBarData(
    spots: spots,
    isCurved: true,
    colors: [_color],
    barWidth: 4,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: false,
    ),
    belowBarData: BarAreaData(
      show: true,
      colors: [
        Color(0xff131e46),
        _color.withOpacity(.5),
      ],
      gradientFrom: Offset(0, 1),
      gradientTo: Offset(0, -1),
    ),
  );

  return [
    lineChartBarData,
  ];
}

// helper class for UI and dev
Color _getCardColor() {
  if (Random().nextBool()) {
    return Colors.red;
  } else {
    return Colors.green;
  }
}
