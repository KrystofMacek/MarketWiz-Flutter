import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:market_wiz_flutter/controllers/overview_controller.dart';
import 'package:market_wiz_flutter/data/database/database.dart';
import 'package:market_wiz_flutter/ui/widgets/overview_widgets/chart.dart';
import '../widgets/overview_widgets/overview_widgets.dart';

class OverviewPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final marketDataProvider = watch(marketDataNotifierProvider);
    final selector = context.read(selectedIndexNotifierProvider);
    final connectivity = Connectivity();

    return Scaffold(
      body: StreamBuilder<bool>(
        stream: connectivity.isConnected,
        builder: (context, isConnected) {
          if (isConnected.hasData) {
            if (isConnected.data) {
               marketDataProvider.loadIndices();
            }
            return StreamBuilder<List<MarketIndexData>>(
              stream: marketDataProvider.indicesData(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data.isNotEmpty) {
                  return Column(
                    children: <Widget>[
                      IndicesListView(
                        selector: selector,
                        data: snapshot.data,
                      ),
                      OverviewChart(
                        data: snapshot.data,
                      ),
                      IndexDataSheet(
                        data: snapshot.data,
                      ),
                    ],
                  );
                } else if (!isConnected.data) {
                  return Center(
                    child: Text('No Internet Connection'),
                  );
                } else {
                   marketDataProvider.loadIndices();
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
