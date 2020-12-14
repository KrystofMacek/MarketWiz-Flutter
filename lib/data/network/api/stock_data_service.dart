import 'package:chopper/chopper.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:market_wiz_flutter/data/network/models/converter.dart';
import 'package:market_wiz_flutter/data/network/models/quote_result.dart';
import 'package:market_wiz_flutter/data/network/models/stock_data_result.dart';

part 'stock_data_service.chopper.dart';

final stockDataServiceProvider = Provider((ref) {
  return StockDataService.create();
});

@ChopperApi()
abstract class StockDataService extends ChopperService {
  @Get(path: 'stock/candle')
  Future<Response<StockDataResult>> getStockData(
    @Query('symbol') String symbol,
    @Query('resolution') String resolution,
    @Query('from') String from,
    @Query('to') String to,
    @Query('token') String token,
  );

  static StockDataService create() {
    final client = ChopperClient(
        baseUrl: 'https://finnhub.io/api/v1',
        interceptors: [HttpLoggingInterceptor()],
        converter: StockDataConverter(),
        errorConverter: JsonConverter(),
        services: [
          _$StockDataService(),
        ]);

    return _$StockDataService(client);
  }
}

final quoteServiceProvider = Provider((ref) {
  return QuoteService.create();
});

@ChopperApi()
abstract class QuoteService extends ChopperService {
  @Get(path: 'quote')
  Future<Response<QuoteResult>> getQuote(
    @Query('symbol') String symbol,
    @Query('token') String token,
  );

  static QuoteService create() {
    final client = ChopperClient(
        baseUrl: 'https://finnhub.io/api/v1',
        interceptors: [HttpLoggingInterceptor()],
        converter: QuoteConverter(),
        errorConverter: JsonConverter(),
        services: [
          _$QuoteService(),
        ]);

    return _$QuoteService(client);
  }
}
