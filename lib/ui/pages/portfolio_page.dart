import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:market_wiz_flutter/common/utils.dart';
import 'package:market_wiz_flutter/controllers/portfolio_controller.dart';
import 'package:market_wiz_flutter/data/database/database.dart';
import '../widgets/portfolio_widgets/portfolio_widgets.dart';

class PortfolioPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final PortfolioController portfolio = watch(portfolioController);
    final PortfolioProvider portfolioItemsProvider =
        watch(portfolioPositionsProvider);

    final connection = Connectivity();

    return Scaffold(
      body: StreamBuilder<bool>(
          stream: connection.isConnected,
          initialData: false,
          builder: (context, snapshot) {
            if (snapshot.data) {
              portfolioItemsProvider.updatePositions();
            }

            return Column(
              children: [
                StreamBuilder<PortfolioData>(
                  initialData: PortfolioData(
                      id: null, openPositionsPL: 0, closedPositionsPL: 0),
                  stream: portfolio.watchPortfolio(),
                  builder: (context, portfolioData) {
                    if (portfolioData.data == null) {
                      portfolio.initPortfolio();
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return StreamBuilder<List<PositionItemData>>(
                        stream: portfolioItemsProvider.watchPositions(),
                        builder: (BuildContext context,
                            AsyncSnapshot portfolioList) {
                          if (portfolioList.hasData) {
                            final double _openPositionPL =
                                _getOpenPL(portfolioList.data);
                            return Expanded(
                              child: Column(
                                children: [
                                  PortfolioDataSheet(
                                      openPL: _openPositionPL,
                                      portfolioData: portfolioData.data),
                                  PositionsListView(
                                    data: portfolioList.data,
                                    provider: portfolioItemsProvider,
                                    portfolio: portfolio,
                                  )
                                ],
                              ),
                            );
                          } else {
                            return Text('No Portfolio Data');
                          }
                        },
                      );
                    }
                  },
                )
              ],
            );
          }),
    );
  }

  double _getOpenPL(List<PositionItemData> list) {
    if (list.isNotEmpty) {
      double d = 0;
      for (var item in list) {
        d += getNetPl(item);
      }
      return d;
    } else {
      return 0;
    }
  }
}
