import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:market_wiz_flutter/data/database/database.dart';
import 'package:market_wiz_flutter/data/database/models/database_models.dart';
import '../../../common/utils.dart';

class DetailsChart extends StatelessWidget {
  DetailsChart({
    Key key,
    this.details,
  }) : super(key: key);

  final StockDataDetail details;

  @override
  Widget build(BuildContext context) {
    final records = details.records.historyRecords;

    if (records.length < 2) {
      return Expanded(
        child: Center(
          child: Container(
            child: Text('Could\'t get data for: ${details.symbol}'),
          ),
        ),
      );
    }

    return Expanded(
      child: Container(
        width: double.infinity,
        child: LineChart(
          _buildChartData(records),
        ),
      ),
    );
  }
}

LineChartData _buildChartData(List<StockDataRecord> records) {
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
      show: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 2,
        );
      },
    ),
    borderData: FlBorderData(
      show: false,
    ),
    titlesData: FlTitlesData(
        leftTitles: SideTitles(
          showTitles: false,
        ),
        rightTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: (minY - maxY).abs() / 5,
          getTextStyles: (value) => const TextStyle(
            color: Colors.white,
          ),
        ),
        bottomTitles: SideTitles(
          showTitles: false,
          getTextStyles: (value) => const TextStyle(
            color: Colors.white,
          ),
        )),
    minX: 0,
    maxX: length,
    maxY: maxY + (0.02 * maxY),
    minY: minY - (0.02 * minY),
    lineBarsData: data,
  );
}

List<LineChartBarData> _buildBarData(List<FlSpot> spots) {
  Color _color = getChartColor(spots[0].y, spots.last.y);

  final LineChartBarData lineChartBarData = LineChartBarData(
    spots: spots,
    isCurved: true,
    colors: [_color],
    barWidth: 2,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: false,
    ),
    belowBarData: BarAreaData(
      show: false,
    ),
  );
  return [
    lineChartBarData,
  ];
}
