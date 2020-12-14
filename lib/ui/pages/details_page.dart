import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:market_wiz_flutter/controllers/details_controller.dart';
import 'package:market_wiz_flutter/data/database/database.dart';
import 'package:market_wiz_flutter/data/database/models/database_models.dart';
import '../widgets/details_widgets/details_widgets.dart';

class DetailsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final detailsProvider = watch(stockDataDetailsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: Search(detailsProvider: detailsProvider),
              );
            },
            icon: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: StreamBuilder<StockDataDetail>(
          stream: detailsProvider.watchDetail(),
          initialData: StockDataDetail(
              symbol: '', records: StockDataRecords(historyRecords: List())),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  DetailsDataSheet(details: snapshot.data),
                  DetailsChart(details: snapshot.data),
                  DetailsActions(
                    details: snapshot.data,
                    controller: detailsProvider,
                  ),
                ],
              );
            } else {
              return Center(
                child: Text('No Data, please provide quote to Search.'),
              );
            }
          },
        ),
      ),
    );
  }
}
