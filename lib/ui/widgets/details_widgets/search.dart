import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:market_wiz_flutter/controllers/details_controller.dart';

class Search extends SearchDelegate {
  Search({this.detailsProvider});
  final StockDetailsProvider detailsProvider;

  final connectivity = Connectivity();

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          print('build actions close btn');
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        print('build leading back btn');
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<bool>(
      stream: connectivity.isConnected,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data) {
            print('true');
            if (query.isNotEmpty) {
              detailsProvider.getDetails(query);
              Navigator.pop(context);
            }
          } else {
            print('false');
            return Center(
              child: Text('No Internet Connection'),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> recentlySearched = ['TSLA', 'AMZN'];
    List<String> autocompleteSuggestions = [
      'TSLA',
      'AMZN',
      'BOO',
      'DSH',
    ];
    List<String> list = [];
    String selectedResult = '';
    query.isEmpty
        ? list = recentlySearched
        : list.addAll(autocompleteSuggestions
            .where((element) => element.contains(query)));
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(list[index]),
          onTap: () {
            selectedResult = list[index];
            showResults(context);
            query = selectedResult;
            recentlySearched.add(selectedResult);
          },
        );
      },
    );
  }
}
