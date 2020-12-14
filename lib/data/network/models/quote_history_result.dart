// To parse this JSON data, do
//
//     final historyResult = historyResultFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HistoryResult historyResultFromJson(String str) =>
    HistoryResult.fromJson(json.decode(str));

String historyResultToJson(HistoryResult data) => json.encode(data.toJson());

class HistoryResult {
  HistoryResult({
    @required this.status,
    @required this.results,
  });

  final Status status;
  final List<Result> results;

  HistoryResult copyWith({
    Status status,
    List<Result> results,
  }) =>
      HistoryResult(
        status: status ?? this.status,
        results: results ?? this.results,
      );

  factory HistoryResult.fromJson(Map<String, dynamic> json) => HistoryResult(
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
    @required this.timestamp,
    @required this.tradingDay,
    @required this.open,
    @required this.high,
    @required this.low,
    @required this.close,
    @required this.volume,
    @required this.openInterest,
  });

  final String symbol;
  final DateTime timestamp;
  final DateTime tradingDay;
  final double open;
  final double high;
  final double low;
  final double close;
  final int volume;
  final int openInterest;

  Result copyWith({
    String symbol,
    DateTime timestamp,
    DateTime tradingDay,
    double open,
    double high,
    double low,
    double close,
    int volume,
    int openInterest,
  }) =>
      Result(
        symbol: symbol ?? this.symbol,
        timestamp: timestamp ?? this.timestamp,
        tradingDay: tradingDay ?? this.tradingDay,
        open: open ?? this.open,
        high: high ?? this.high,
        low: low ?? this.low,
        close: close ?? this.close,
        volume: volume ?? this.volume,
        openInterest: openInterest ?? this.openInterest,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        symbol: json["symbol"],
        timestamp: DateTime.parse(json["timestamp"]),
        tradingDay: DateTime.parse(json["tradingDay"]),
        open: json["open"].toDouble(),
        high: json["high"].toDouble(),
        low: json["low"].toDouble(),
        close: json["close"].toDouble(),
        volume: json["volume"],
        openInterest: json["openInterest"],
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "timestamp": timestamp.toIso8601String(),
        "tradingDay":
            "${tradingDay.year.toString().padLeft(4, '0')}-${tradingDay.month.toString().padLeft(2, '0')}-${tradingDay.day.toString().padLeft(2, '0')}",
        "open": open,
        "high": high,
        "low": low,
        "close": close,
        "volume": volume,
        "openInterest": openInterest,
      };

  @override
  String toString() {
    return 'close: $close';
  }
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
