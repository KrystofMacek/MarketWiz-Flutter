import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:moor/moor.dart';

part 'quote_history.g.dart';

class QuoteHistory extends Table {
  TextColumn get symbol => text().withLength(min: 1, max: 10)();
  TextColumn get records => text().map(const HistoryRecordsConverter())();

  @override
  Set<Column> get primaryKey => {symbol};
}

class HistoryRecordsConverter extends TypeConverter<HistoryRecords, String> {
  const HistoryRecordsConverter();

  @override
  HistoryRecords mapToDart(String fromDb) {
    if (fromDb == null) {
      return HistoryRecords(historyRecords: []);
    }
    return HistoryRecords.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(HistoryRecords value) {
    if (value == null) {
      return null;
    }
    return json.encode(value.toJson());
  }
}

@JsonSerializable()
class HistoryRecords {
  HistoryRecords({this.historyRecords});
  final List<Record> historyRecords;

  factory HistoryRecords.fromJson(Map<String, dynamic> json) =>
      _$HistoryRecordsFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryRecordsToJson(this);
}

@JsonSerializable()
class Record {
  Record({this.close, this.high, this.low, this.open});
  final double close;
  final double high;
  final double low;
  final double open;

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);

  Map<String, dynamic> toJson() => _$RecordToJson(this);
}
