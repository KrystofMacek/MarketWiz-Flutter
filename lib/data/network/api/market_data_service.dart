import 'package:chopper/chopper.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:market_wiz_flutter/common/constants.dart';
import 'package:market_wiz_flutter/data/network/models/converter.dart';
import 'package:market_wiz_flutter/data/network/models/market_index_result.dart';
import 'package:market_wiz_flutter/data/network/models/quote_history_result.dart';

part 'market_data_service.chopper.dart';

final marketDataServiceProvider = Provider((ref) {
  print('MarketDataService provider');
  return MarketDataService.create();
});

@ChopperApi()
abstract class MarketDataService extends ChopperService {
  @Get(path: 'getQuote$MD_API_KEY')
  // function that returns a Future of a Chopper Response using the previously created Popular class.
  Future<Response<MarketIndexResult>> getMarketIndicesData(
    @Query('symbols') String symbol,
    @Query('fields') String fields,
  );

  static MarketDataService create() {
    final client = ChopperClient(
      baseUrl: 'https://marketdata.websol.barchart.com',
      interceptors: [HttpLoggingInterceptor()],
      converter: MarketIndexConverter(),
      errorConverter: JsonConverter(),
      services: [
        _$MarketDataService(),
      ],
    );

    return _$MarketDataService(client);
  }
}

final historyDataServiceProvider = Provider((ref) {
  print('HistoryDataService provider');
  return HistoryDataService.create();
});

@ChopperApi()
abstract class HistoryDataService extends ChopperService {
  @Get(path: 'getHistory$MD_API_KEY')
  Future<Response<HistoryResult>> getQuotesHistory(
    @Query("symbol") String symbol,
    @Query("type") String type,
    @Query("startDate") String startDate,
    @Query("endDate") String endDate,
    @Query("order") String order,
  );

  static HistoryDataService create() {
    final client = ChopperClient(
      baseUrl: 'https://marketdata.websol.barchart.com',
      interceptors: [HttpLoggingInterceptor(), CurlInterceptor()],
      converter: HistoryConverter(),
      errorConverter: JsonConverter(),
      services: [
        _$HistoryDataService(),
      ],
    );

    return _$HistoryDataService(client);
  }
}
