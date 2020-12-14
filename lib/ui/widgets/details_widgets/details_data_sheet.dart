import 'package:flutter/material.dart';
import 'package:market_wiz_flutter/data/database/database.dart';
import 'package:market_wiz_flutter/data/database/models/database_models.dart';
import '../../../common/text_themes.dart';
import '../../../common/utils.dart';

class DetailsDataSheet extends StatelessWidget {
  const DetailsDataSheet({
    Key key,
    @required this.details,
  }) : super(key: key);

  final StockDataDetail details;

  @override
  Widget build(BuildContext context) {
    double _high;
    double _low;
    if (details.records.historyRecords.isEmpty) {
      details.records.historyRecords
          .add(StockDataRecord(close: 0, high: 0, low: 0, volume: 0, open: 0));
    }

    _high = details.records.historyRecords.first.high;
    _low = details.records.historyRecords.first.low;

    for (var item in details.records.historyRecords) {
      if (item.high > _high) {
        _high = item.high;
      }
      if (item.low < _low) {
        _low = item.low;
      }
    }

    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Card(
        color: Theme.of(context).primaryColorDark,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    details.symbol.toUpperCase(),
                    style: TextThemes.mainTitleStyle(context),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              'Last Price',
                              style: TextThemes.dataSheetvaluesStyle(context),
                            ),
                          ),
                          Container(
                            child: Text(
                              '${roundDouble(details.records.historyRecords.last.close, 2)}',
                              style: TextThemes.dataSheetvaluesStyle(context),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Text(
                              'High',
                              style: TextThemes.dataSheetvaluesStyle(context),
                            ),
                          ),
                          Container(
                            child: Text(
                              '${roundDouble(_high, 2)}',
                              style: TextThemes.dataSheetvaluesStyle(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              'Last Open',
                              style: TextThemes.dataSheetvaluesStyle(context),
                            ),
                          ),
                          Container(
                            child: Text(
                              '${roundDouble(details.records.historyRecords.last.open, 2)}',
                              style: TextThemes.dataSheetvaluesStyle(context),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Text(
                              'Low',
                              style: TextThemes.dataSheetvaluesStyle(context),
                            ),
                          ),
                          Container(
                            child: Text(
                              '${roundDouble(_low, 2)}',
                              style: TextThemes.dataSheetvaluesStyle(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
