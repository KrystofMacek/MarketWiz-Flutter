// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_data_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$StockDataService extends StockDataService {
  _$StockDataService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = StockDataService;

  @override
  Future<Response<StockDataResult>> getStockData(
      String symbol, String resolution, String from, String to, String token) {
    final $url = 'stock/candle';
    final $params = <String, dynamic>{
      'symbol': symbol,
      'resolution': resolution,
      'from': from,
      'to': to,
      'token': token
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<StockDataResult, StockDataResult>($request);
  }
}

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$QuoteService extends QuoteService {
  _$QuoteService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = QuoteService;

  @override
  Future<Response<QuoteResult>> getQuote(String symbol, String token) {
    final $url = 'quote';
    final $params = <String, dynamic>{'symbol': symbol, 'token': token};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<QuoteResult, QuoteResult>($request);
  }
}
