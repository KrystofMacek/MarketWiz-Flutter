import 'package:json_annotation/json_annotation.dart';
import 'package:moor/moor.dart';
import 'dart:convert';
part 'stock_data.g.dart';

class StockDataDetails extends Table {
  TextColumn get symbol => text().withLength(min: 1, max: 10)();
  TextColumn get records => text().map(const StockDataRecordsConverter())();

  @override
  Set<Column> get primaryKey => {symbol};
}

class StockDataRecordsConverter
    extends TypeConverter<StockDataRecords, String> {
  const StockDataRecordsConverter();

  @override
  StockDataRecords mapToDart(String fromDb) {
    if (fromDb == null) {
      return StockDataRecords(historyRecords: []);
    }
    return StockDataRecords.fromJson(
        json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(StockDataRecords value) {
    if (value == null) {
      return null;
    }
    return json.encode(value.toJson());
  }
}

@JsonSerializable()
class StockDataRecords {
  StockDataRecords({this.historyRecords});
  final List<StockDataRecord> historyRecords;

  factory StockDataRecords.fromJson(Map<String, dynamic> json) =>
      _$StockDataRecordsFromJson(json);

  Map<String, dynamic> toJson() => _$StockDataRecordsToJson(this);
}

@JsonSerializable()
class StockDataRecord {
  StockDataRecord(
      {this.close,
      this.high,
      this.low,
      this.open,
      this.volume,
      this.timestamp});
  final double close;
  final double high;
  final double low;
  final double open;
  final int volume;
  final int timestamp;

  factory StockDataRecord.fromJson(Map<String, dynamic> json) =>
      _$StockDataRecordFromJson(json);

  Map<String, dynamic> toJson() => _$StockDataRecordToJson(this);
}
