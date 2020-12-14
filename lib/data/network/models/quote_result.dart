// To parse this JSON data, do
//
//     final quoteResult = quoteResultFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

QuoteResult quoteResultFromJson(String str) =>
    QuoteResult.fromJson(json.decode(str));

String quoteResultToJson(QuoteResult data) => json.encode(data.toJson());

class QuoteResult {
  QuoteResult({
    @required this.c,
    @required this.h,
    @required this.l,
    @required this.o,
    @required this.pc,
    @required this.t,
  });

  final double c;
  final double h;
  final double l;
  final double o;
  final double pc;
  final int t;

  QuoteResult copyWith({
    double c,
    double h,
    double l,
    double o,
    double pc,
    int t,
  }) =>
      QuoteResult(
        c: c ?? this.c,
        h: h ?? this.h,
        l: l ?? this.l,
        o: o ?? this.o,
        pc: pc ?? this.pc,
        t: t ?? this.t,
      );

  factory QuoteResult.fromJson(Map<String, dynamic> json) => QuoteResult(
        c: json["c"].toDouble(),
        h: json["h"].toDouble(),
        l: json["l"].toDouble(),
        o: json["o"].toDouble(),
        pc: json["pc"].toDouble(),
        t: json["t"],
      );

  Map<String, dynamic> toJson() => {
        "c": c,
        "h": h,
        "l": l,
        "o": o,
        "pc": pc,
        "t": t,
      };
}
