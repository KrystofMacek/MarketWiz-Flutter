// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryRecords _$HistoryRecordsFromJson(Map<String, dynamic> json) {
  return HistoryRecords(
    historyRecords: (json['historyRecords'] as List)
        ?.map((e) =>
            e == null ? null : Record.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HistoryRecordsToJson(HistoryRecords instance) =>
    <String, dynamic>{
      'historyRecords': instance.historyRecords,
    };

Record _$RecordFromJson(Map<String, dynamic> json) {
  return Record(
    close: (json['close'] as num)?.toDouble(),
    high: (json['high'] as num)?.toDouble(),
    low: (json['low'] as num)?.toDouble(),
    open: (json['open'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$RecordToJson(Record instance) => <String, dynamic>{
      'close': instance.close,
      'high': instance.high,
      'low': instance.low,
      'open': instance.open,
    };
