import 'package:flutter/material.dart';
import 'package:market_wiz_flutter/common/text_themes.dart';
import 'package:market_wiz_flutter/common/utils.dart';
import 'package:market_wiz_flutter/controllers/overview_controller.dart';
import 'package:market_wiz_flutter/data/database/database.dart';

class IndicesListView extends StatelessWidget {
  final List<MarketIndexData> data;
  final SelectedIndexNotifier selector;

  const IndicesListView({this.selector, this.data, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("LIST BUILD");

    return Container(
      padding: EdgeInsets.only(
        top: 40,
        bottom: 20,
      ),
      height: 200,
      child: ListView.separated(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        separatorBuilder: (BuildContext context, int index) => const Divider(
          indent: 20,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          String name = _nameOfIndex(data[index].symbol);
          double change = data[index].netChange;
          String textChange = _getTextChange(
              data[index].netChange, data[index].percentageChange);
          String currentPrice = data[index].lastPrice.toString();

          return GestureDetector(
            onTap: () => selector.selectIndex(index),
            child: Container(
              width: 200,
              child: Card(
                elevation: 14,
                color: getCardColor(change),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          '$name',
                          style: TextThemes.indexCardMain(context),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '$textChange',
                                style: TextThemes.indexCardSmall(context),
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '$currentPrice',
                              style: TextThemes.indexCardBig(context),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// helper class for UI and dev

String _getTextChange(double netChange, double percentageChange) {
  if (netChange >= 0) {
    return '+$netChange (+$percentageChange%)';
  } else {
    return '$netChange ($percentageChange%)';
  }
}

String _nameOfIndex(String symbol) {
  var id = symbol.substring(0, 2);

  String name;
  switch (id) {
    case ("ES"):
      name = "S&P 500";
      break;
    case ("NQ"):
      name = "NASDAQ";
      break;
    case ("YM"):
      name = "DOW J.";
      break;
    case ("QR"):
      name = "RUSSEL";
      break;
  }
  return name;
}
