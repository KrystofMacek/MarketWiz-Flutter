// To parse this JSON data, do
//
//     final stockDataResult = stockDataResultFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

StockDataResult stockDataResultFromJson(String str) =>
    StockDataResult.fromJson(json.decode(str));

String stockDataResultToJson(StockDataResult data) =>
    json.encode(data.toJson());

@JsonSerializable()
class StockDataResult {
  StockDataResult({
    @required this.c,
    @required this.h,
    @required this.l,
    @required this.o,
    @required this.s,
    @required this.t,
    @required this.v,
  });

  final List<double> c;
  final List<double> h;
  final List<double> l;
  final List<double> o;
  final String s;
  final List<int> t;
  final List<int> v;

  StockDataResult copyWith({
    List<double> c,
    List<double> h,
    List<double> l,
    List<double> o,
    String s,
    List<int> t,
    List<int> v,
  }) =>
      StockDataResult(
        c: c ?? this.c,
        h: h ?? this.h,
        l: l ?? this.l,
        o: o ?? this.o,
        s: s ?? this.s,
        t: t ?? this.t,
        v: v ?? this.v,
      );

  factory StockDataResult.fromJson(Map<String, dynamic> json) =>
      StockDataResult(
        c: List<double>.from(json["c"].map((x) => x.toDouble())),
        h: List<double>.from(json["h"].map((x) => x.toDouble())),
        l: List<double>.from(json["l"].map((x) => x.toDouble())),
        o: List<double>.from(json["o"].map((x) => x.toDouble())),
        s: json["s"],
        t: List<int>.from(json["t"].map((x) => x)),
        v: List<int>.from(json["v"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "c": List<dynamic>.from(c.map((x) => x)),
        "h": List<dynamic>.from(h.map((x) => x)),
        "l": List<dynamic>.from(l.map((x) => x)),
        "o": List<dynamic>.from(o.map((x) => x)),
        "s": s,
        "t": List<dynamic>.from(t.map((x) => x)),
        "v": List<dynamic>.from(v.map((x) => x)),
      };
}
