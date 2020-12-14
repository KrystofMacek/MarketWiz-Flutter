// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockDataRecords _$StockDataRecordsFromJson(Map<String, dynamic> json) {
  return StockDataRecords(
    historyRecords: (json['historyRecords'] as List)
        ?.map((e) => e == null
            ? null
            : StockDataRecord.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StockDataRecordsToJson(StockDataRecords instance) =>
    <String, dynamic>{
      'historyRecords': instance.historyRecords,
    };

StockDataRecord _$StockDataRecordFromJson(Map<String, dynamic> json) {
  return StockDataRecord(
    close: (json['close'] as num)?.toDouble(),
    high: (json['high'] as num)?.toDouble(),
    low: (json['low'] as num)?.toDouble(),
    open: (json['open'] as num)?.toDouble(),
    volume: json['volume'] as int,
    timestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$StockDataRecordToJson(StockDataRecord instance) =>
    <String, dynamic>{
      'close': instance.close,
      'high': instance.high,
      'low': instance.low,
      'open': instance.open,
      'volume': instance.volume,
      'timestamp': instance.timestamp,
    };
