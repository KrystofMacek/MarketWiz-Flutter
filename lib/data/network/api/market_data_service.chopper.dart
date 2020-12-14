// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_data_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$MarketDataService extends MarketDataService {
  _$MarketDataService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = MarketDataService;

  @override
  Future<Response<MarketIndexResult>> getMarketIndicesData(
      String symbol, String fields) {
    final $url = 'getQuote.json?apikey=6261bdce277834ce4d53fd82e5bce6d6';
    final $params = <String, dynamic>{'symbols': symbol, 'fields': fields};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<MarketIndexResult, MarketIndexResult>($request);
  }
}

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$HistoryDataService extends HistoryDataService {
  _$HistoryDataService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = HistoryDataService;

  @override
  Future<Response<HistoryResult>> getQuotesHistory(String symbol, String type,
      String startDate, String endDate, String order) {
    final $url = 'getHistory.json?apikey=6261bdce277834ce4d53fd82e5bce6d6';
    final $params = <String, dynamic>{
      'symbol': symbol,
      'type': type,
      'startDate': startDate,
      'endDate': endDate,
      'order': order
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<HistoryResult, HistoryResult>($request);
  }
}
