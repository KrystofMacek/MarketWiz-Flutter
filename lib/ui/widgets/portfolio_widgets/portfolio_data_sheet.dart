import 'package:flutter/material.dart';
import 'package:market_wiz_flutter/data/database/database.dart';
import '../../../common/text_themes.dart';
import '../../../common/utils.dart';

class PortfolioDataSheet extends StatelessWidget {
  const PortfolioDataSheet({
    Key key,
    this.portfolioData,
    this.openPL,
  }) : super(key: key);

  final PortfolioData portfolioData;
  final double openPL;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20,
        right: 10,
        left: 10,
        bottom: 10,
      ),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: Theme.of(context).primaryColorDark,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 30,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current P/L:',
                    style: TextThemes.dataSheetTitleStyle(context),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${roundDouble(openPL, 2)}\$',
                    style: TextThemes.dataSheetvaluesStyle(context),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Total P/L:',
                    style: TextThemes.dataSheetTitleStyle(context),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${doubleToPVString(roundDouble(portfolioData.closedPositionsPL, 2))} \$',
                    style: TextThemes.dataSheetvaluesStyle(context),
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
