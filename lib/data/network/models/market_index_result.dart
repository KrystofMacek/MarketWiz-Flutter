// To parse this JSON data, do
//
//     final marketIndexResult = marketIndexResultFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MarketIndexResult marketIndexResultFromJson(String str) =>
    MarketIndexResult.fromJson(json.decode(str));

String marketIndexResultToJson(MarketIndexResult data) =>
    json.encode(data.toJson());

class MarketIndexResult {
  MarketIndexResult({
    @required this.status,
    @required this.results,
  });

  final Status status;
  final List<Result> results;

  MarketIndexResult copyWith({
    Status status,
    List<Result> results,
  }) =>
      MarketIndexResult(
        status: status ?? this.status,
        results: results ?? this.results,
      );

  factory MarketIndexResult.fromJson(Map<String, dynamic> json) =>
      MarketIndexResult(
        status: Status.fromJson(json["status"]),
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    @required this.symbol,
    @required this.exchange,
    @required this.name,
    @required this.dayCode,
    @required this.serverTimestamp,
    @required this.mode,
    @required this.lastPrice,
    @required this.tradeTimestamp,
    @required this.netChange,
    @required this.percentChange,
    @required this.unitCode,
    @required this.open,
    @required this.high,
    @required this.low,
    @required this.close,
    @required this.flag,
    @required this.volume,
    @required this.fiftyTwoWkHigh,
    @required this.fiftyTwoWkLow,
  });

  final String symbol;
  final String exchange;
  final String name;
  final String dayCode;
  final DateTime serverTimestamp;
  final String mode;
  final double lastPrice;
  final DateTime tradeTimestamp;
  final double netChange;
  final double percentChange;
  final String unitCode;
  final double open;
  final double high;
  final double low;
  final double close;
  final String flag;
  final int volume;
  final double fiftyTwoWkHigh;
  final double fiftyTwoWkLow;

  Result copyWith({
    String symbol,
    String exchange,
    String name,
    String dayCode,
    DateTime serverTimestamp,
    String mode,
    double lastPrice,
    DateTime tradeTimestamp,
    double netChange,
    double percentChange,
    String unitCode,
    double open,
    double high,
    double low,
    double close,
    String flag,
    int volume,
    double fiftyTwoWkHigh,
    double fiftyTwoWkLow,
  }) =>
      Result(
        symbol: symbol ?? this.symbol,
        exchange: exchange ?? this.exchange,
        name: name ?? this.name,
        dayCode: dayCode ?? this.dayCode,
        serverTimestamp: serverTimestamp ?? this.serverTimestamp,
        mode: mode ?? this.mode,
        lastPrice: lastPrice ?? this.lastPrice,
        tradeTimestamp: tradeTimestamp ?? this.tradeTimestamp,
        netChange: netChange ?? this.netChange,
        percentChange: percentChange ?? this.percentChange,
        unitCode: unitCode ?? this.unitCode,
        open: open ?? this.open,
        high: high ?? this.high,
        low: low ?? this.low,
        close: close ?? this.close,
        flag: flag ?? this.flag,
        volume: volume ?? this.volume,
        fiftyTwoWkHigh: fiftyTwoWkHigh ?? this.fiftyTwoWkHigh,
        fiftyTwoWkLow: fiftyTwoWkLow ?? this.fiftyTwoWkLow,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        symbol: json["symbol"],
        exchange: json["exchange"],
        name: json["name"],
        dayCode: json["dayCode"],
        serverTimestamp: DateTime.parse(json["serverTimestamp"]),
        mode: json["mode"],
        lastPrice: json["lastPrice"].toDouble(),
        tradeTimestamp: DateTime.parse(json["tradeTimestamp"]),
        netChange: json["netChange"].toDouble(),
        percentChange: json["percentChange"].toDouble(),
        unitCode: json["unitCode"],
        open: json["open"].toDouble(),
        high: json["high"].toDouble(),
        low: json["low"].toDouble(),
        close: json["close"].toDouble(),
        flag: json["flag"],
        volume: json["volume"],
        fiftyTwoWkHigh: json["fiftyTwoWkHigh"].toDouble(),
        fiftyTwoWkLow: json["fiftyTwoWkLow"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "exchange": exchange,
        "name": name,
        "dayCode": dayCode,
        "serverTimestamp": serverTimestamp.toIso8601String(),
        "mode": mode,
        "lastPrice": lastPrice,
        "tradeTimestamp": tradeTimestamp.toIso8601String(),
        "netChange": netChange,
        "percentChange": percentChange,
        "unitCode": unitCode,
        "open": open,
        "high": high,
        "low": low,
        "close": close,
        "flag": flag,
        "volume": volume,
        "fiftyTwoWkHigh": fiftyTwoWkHigh,
        "fiftyTwoWkLow": fiftyTwoWkLow,
      };
}

class Status {
  Status({
    @required this.code,
    @required this.message,
  });

  final int code;
  final String message;

  Status copyWith({
    int code,
    String message,
  }) =>
      Status(
        code: code ?? this.code,
        message: message ?? this.message,
      );

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
