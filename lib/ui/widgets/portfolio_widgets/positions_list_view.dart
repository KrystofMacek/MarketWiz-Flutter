import 'package:flutter/material.dart';
import 'package:market_wiz_flutter/controllers/portfolio_controller.dart';
import 'package:market_wiz_flutter/data/database/database.dart';
import './item_position.dart';

class PositionsListView extends StatelessWidget {
  const PositionsListView({
    Key key,
    this.data,
    this.provider,
    this.portfolio,
  }) : super(key: key);

  final List<PositionItemData> data;
  final PortfolioProvider provider;
  final PortfolioController portfolio;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<PortfolioData>(
        stream: portfolio.watchPortfolio(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListView.separated(
                itemCount: data.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  indent: 20,
                ),
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(data[index].id.toString()),
                    onDismissed: (direction) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "${data[index].symbol} removed from watchlist."),
                        ),
                      );
                      provider.removePosition(snapshot.data, data[index]);
                      build(context);
                    },
                    child: ItemPosition(
                      item: data[index],
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
