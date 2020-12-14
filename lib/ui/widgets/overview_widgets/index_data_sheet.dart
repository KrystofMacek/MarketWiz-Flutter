import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:market_wiz_flutter/common/text_themes.dart';
import 'package:market_wiz_flutter/controllers/overview_controller.dart';
import 'package:market_wiz_flutter/data/database/database.dart';

class IndexDataSheet extends ConsumerWidget {
  final List<MarketIndexData> data;

  IndexDataSheet({this.data, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final selectedIndex = watch(selectedIndexNotifierProvider.state);

    final selectedItem = data[selectedIndex];

    print("DATA SHEET BUILD");

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'YTD High:',
                    style: TextThemes.dataSheetTitleStyle(context),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${selectedItem.fiftyTwoWeekHigh}',
                    style: TextThemes.dataSheetvaluesStyle(context),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Volume:',
                    style: TextThemes.dataSheetTitleStyle(context),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${selectedItem.volume}',
                    style: TextThemes.dataSheetvaluesStyle(context),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'YTD Low:',
                    style: TextThemes.dataSheetTitleStyle(context),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${selectedItem.fiftyTwoWeekLow}',
                    style: TextThemes.dataSheetvaluesStyle(context),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Exchange:',
                    style: TextThemes.dataSheetTitleStyle(context),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${selectedItem.exchange}',
                    style: TextThemes.dataSheetvaluesStyle(context),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
