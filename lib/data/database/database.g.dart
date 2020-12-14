// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class MarketIndexData extends DataClass implements Insertable<MarketIndexData> {
  final String symbol;
  final String name;
  final String exchange;
  final double lastPrice;
  final double netChange;
  final double percentageChange;
  final double fiftyTwoWeekHigh;
  final double fiftyTwoWeekLow;
  final int volume;
  MarketIndexData(
      {@required this.symbol,
      @required this.name,
      @required this.exchange,
      @required this.lastPrice,
      @required this.netChange,
      @required this.percentageChange,
      @required this.fiftyTwoWeekHigh,
      @required this.fiftyTwoWeekLow,
      @required this.volume});
  factory MarketIndexData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final intType = db.typeSystem.forDartType<int>();
    return MarketIndexData(
      symbol:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}symbol']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      exchange: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}exchange']),
      lastPrice: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_price']),
      netChange: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}net_change']),
      percentageChange: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}percentage_change']),
      fiftyTwoWeekHigh: doubleType.mapFromDatabaseResponse(
          data['${effectivePrefix}fifty_two_week_high']),
      fiftyTwoWeekLow: doubleType.mapFromDatabaseResponse(
          data['${effectivePrefix}fifty_two_week_low']),
      volume: intType.mapFromDatabaseResponse(data['${effectivePrefix}volume']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || symbol != null) {
      map['symbol'] = Variable<String>(symbol);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || exchange != null) {
      map['exchange'] = Variable<String>(exchange);
    }
    if (!nullToAbsent || lastPrice != null) {
      map['last_price'] = Variable<double>(lastPrice);
    }
    if (!nullToAbsent || netChange != null) {
      map['net_change'] = Variable<double>(netChange);
    }
    if (!nullToAbsent || percentageChange != null) {
      map['percentage_change'] = Variable<double>(percentageChange);
    }
    if (!nullToAbsent || fiftyTwoWeekHigh != null) {
      map['fifty_two_week_high'] = Variable<double>(fiftyTwoWeekHigh);
    }
    if (!nullToAbsent || fiftyTwoWeekLow != null) {
      map['fifty_two_week_low'] = Variable<double>(fiftyTwoWeekLow);
    }
    if (!nullToAbsent || volume != null) {
      map['volume'] = Variable<int>(volume);
    }
    return map;
  }

  MarketIndexCompanion toCompanion(bool nullToAbsent) {
    return MarketIndexCompanion(
      symbol:
          symbol == null && nullToAbsent ? const Value.absent() : Value(symbol),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      exchange: exchange == null && nullToAbsent
          ? const Value.absent()
          : Value(exchange),
      lastPrice: lastPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPrice),
      netChange: netChange == null && nullToAbsent
          ? const Value.absent()
          : Value(netChange),
      percentageChange: percentageChange == null && nullToAbsent
          ? const Value.absent()
          : Value(percentageChange),
      fiftyTwoWeekHigh: fiftyTwoWeekHigh == null && nullToAbsent
          ? const Value.absent()
          : Value(fiftyTwoWeekHigh),
      fiftyTwoWeekLow: fiftyTwoWeekLow == null && nullToAbsent
          ? const Value.absent()
          : Value(fiftyTwoWeekLow),
      volume:
          volume == null && nullToAbsent ? const Value.absent() : Value(volume),
    );
  }

  factory MarketIndexData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MarketIndexData(
      symbol: serializer.fromJson<String>(json['symbol']),
      name: serializer.fromJson<String>(json['name']),
      exchange: serializer.fromJson<String>(json['exchange']),
      lastPrice: serializer.fromJson<double>(json['lastPrice']),
      netChange: serializer.fromJson<double>(json['netChange']),
      percentageChange: serializer.fromJson<double>(json['percentageChange']),
      fiftyTwoWeekHigh: serializer.fromJson<double>(json['fiftyTwoWeekHigh']),
      fiftyTwoWeekLow: serializer.fromJson<double>(json['fiftyTwoWeekLow']),
      volume: serializer.fromJson<int>(json['volume']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'symbol': serializer.toJson<String>(symbol),
      'name': serializer.toJson<String>(name),
      'exchange': serializer.toJson<String>(exchange),
      'lastPrice': serializer.toJson<double>(lastPrice),
      'netChange': serializer.toJson<double>(netChange),
      'percentageChange': serializer.toJson<double>(percentageChange),
      'fiftyTwoWeekHigh': serializer.toJson<double>(fiftyTwoWeekHigh),
      'fiftyTwoWeekLow': serializer.toJson<double>(fiftyTwoWeekLow),
      'volume': serializer.toJson<int>(volume),
    };
  }

  MarketIndexData copyWith(
          {String symbol,
          String name,
          String exchange,
          double lastPrice,
          double netChange,
          double percentageChange,
          double fiftyTwoWeekHigh,
          double fiftyTwoWeekLow,
          int volume}) =>
      MarketIndexData(
        symbol: symbol ?? this.symbol,
        name: name ?? this.name,
        exchange: exchange ?? this.exchange,
        lastPrice: lastPrice ?? this.lastPrice,
        netChange: netChange ?? this.netChange,
        percentageChange: percentageChange ?? this.percentageChange,
        fiftyTwoWeekHigh: fiftyTwoWeekHigh ?? this.fiftyTwoWeekHigh,
        fiftyTwoWeekLow: fiftyTwoWeekLow ?? this.fiftyTwoWeekLow,
        volume: volume ?? this.volume,
      );
  @override
  String toString() {
    return (StringBuffer('MarketIndexData(')
          ..write('symbol: $symbol, ')
          ..write('name: $name, ')
          ..write('exchange: $exchange, ')
          ..write('lastPrice: $lastPrice, ')
          ..write('netChange: $netChange, ')
          ..write('percentageChange: $percentageChange, ')
          ..write('fiftyTwoWeekHigh: $fiftyTwoWeekHigh, ')
          ..write('fiftyTwoWeekLow: $fiftyTwoWeekLow, ')
          ..write('volume: $volume')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      symbol.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              exchange.hashCode,
              $mrjc(
                  lastPrice.hashCode,
                  $mrjc(
                      netChange.hashCode,
                      $mrjc(
                          percentageChange.hashCode,
                          $mrjc(
                              fiftyTwoWeekHigh.hashCode,
                              $mrjc(fiftyTwoWeekLow.hashCode,
                                  volume.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MarketIndexData &&
          other.symbol == this.symbol &&
          other.name == this.name &&
          other.exchange == this.exchange &&
          other.lastPrice == this.lastPrice &&
          other.netChange == this.netChange &&
          other.percentageChange == this.percentageChange &&
          other.fiftyTwoWeekHigh == this.fiftyTwoWeekHigh &&
          other.fiftyTwoWeekLow == this.fiftyTwoWeekLow &&
          other.volume == this.volume);
}

class MarketIndexCompanion extends UpdateCompanion<MarketIndexData> {
  final Value<String> symbol;
  final Value<String> name;
  final Value<String> exchange;
  final Value<double> lastPrice;
  final Value<double> netChange;
  final Value<double> percentageChange;
  final Value<double> fiftyTwoWeekHigh;
  final Value<double> fiftyTwoWeekLow;
  final Value<int> volume;
  const MarketIndexCompanion({
    this.symbol = const Value.absent(),
    this.name = const Value.absent(),
    this.exchange = const Value.absent(),
    this.lastPrice = const Value.absent(),
    this.netChange = const Value.absent(),
    this.percentageChange = const Value.absent(),
    this.fiftyTwoWeekHigh = const Value.absent(),
    this.fiftyTwoWeekLow = const Value.absent(),
    this.volume = const Value.absent(),
  });
  MarketIndexCompanion.insert({
    @required String symbol,
    @required String name,
    @required String exchange,
    @required double lastPrice,
    @required double netChange,
    @required double percentageChange,
    @required double fiftyTwoWeekHigh,
    @required double fiftyTwoWeekLow,
    @required int volume,
  })  : symbol = Value(symbol),
        name = Value(name),
        exchange = Value(exchange),
        lastPrice = Value(lastPrice),
        netChange = Value(netChange),
        percentageChange = Value(percentageChange),
        fiftyTwoWeekHigh = Value(fiftyTwoWeekHigh),
        fiftyTwoWeekLow = Value(fiftyTwoWeekLow),
        volume = Value(volume);
  static Insertable<MarketIndexData> custom({
    Expression<String> symbol,
    Expression<String> name,
    Expression<String> exchange,
    Expression<double> lastPrice,
    Expression<double> netChange,
    Expression<double> percentageChange,
    Expression<double> fiftyTwoWeekHigh,
    Expression<double> fiftyTwoWeekLow,
    Expression<int> volume,
  }) {
    return RawValuesInsertable({
      if (symbol != null) 'symbol': symbol,
      if (name != null) 'name': name,
      if (exchange != null) 'exchange': exchange,
      if (lastPrice != null) 'last_price': lastPrice,
      if (netChange != null) 'net_change': netChange,
      if (percentageChange != null) 'percentage_change': percentageChange,
      if (fiftyTwoWeekHigh != null) 'fifty_two_week_high': fiftyTwoWeekHigh,
      if (fiftyTwoWeekLow != null) 'fifty_two_week_low': fiftyTwoWeekLow,
      if (volume != null) 'volume': volume,
    });
  }

  MarketIndexCompanion copyWith(
      {Value<String> symbol,
      Value<String> name,
      Value<String> exchange,
      Value<double> lastPrice,
      Value<double> netChange,
      Value<double> percentageChange,
      Value<double> fiftyTwoWeekHigh,
      Value<double> fiftyTwoWeekLow,
      Value<int> volume}) {
    return MarketIndexCompanion(
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      exchange: exchange ?? this.exchange,
      lastPrice: lastPrice ?? this.lastPrice,
      netChange: netChange ?? this.netChange,
      percentageChange: percentageChange ?? this.percentageChange,
      fiftyTwoWeekHigh: fiftyTwoWeekHigh ?? this.fiftyTwoWeekHigh,
      fiftyTwoWeekLow: fiftyTwoWeekLow ?? this.fiftyTwoWeekLow,
      volume: volume ?? this.volume,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (exchange.present) {
      map['exchange'] = Variable<String>(exchange.value);
    }
    if (lastPrice.present) {
      map['last_price'] = Variable<double>(lastPrice.value);
    }
    if (netChange.present) {
      map['net_change'] = Variable<double>(netChange.value);
    }
    if (percentageChange.present) {
      map['percentage_change'] = Variable<double>(percentageChange.value);
    }
    if (fiftyTwoWeekHigh.present) {
      map['fifty_two_week_high'] = Variable<double>(fiftyTwoWeekHigh.value);
    }
    if (fiftyTwoWeekLow.present) {
      map['fifty_two_week_low'] = Variable<double>(fiftyTwoWeekLow.value);
    }
    if (volume.present) {
      map['volume'] = Variable<int>(volume.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MarketIndexCompanion(')
          ..write('symbol: $symbol, ')
          ..write('name: $name, ')
          ..write('exchange: $exchange, ')
          ..write('lastPrice: $lastPrice, ')
          ..write('netChange: $netChange, ')
          ..write('percentageChange: $percentageChange, ')
          ..write('fiftyTwoWeekHigh: $fiftyTwoWeekHigh, ')
          ..write('fiftyTwoWeekLow: $fiftyTwoWeekLow, ')
          ..write('volume: $volume')
          ..write(')'))
        .toString();
  }
}

class $MarketIndexTable extends MarketIndex
    with TableInfo<$MarketIndexTable, MarketIndexData> {
  final GeneratedDatabase _db;
  final String _alias;
  $MarketIndexTable(this._db, [this._alias]);
  final VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  GeneratedTextColumn _symbol;
  @override
  GeneratedTextColumn get symbol => _symbol ??= _constructSymbol();
  GeneratedTextColumn _constructSymbol() {
    return GeneratedTextColumn('symbol', $tableName, false,
        minTextLength: 1, maxTextLength: 10);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _exchangeMeta = const VerificationMeta('exchange');
  GeneratedTextColumn _exchange;
  @override
  GeneratedTextColumn get exchange => _exchange ??= _constructExchange();
  GeneratedTextColumn _constructExchange() {
    return GeneratedTextColumn('exchange', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _lastPriceMeta = const VerificationMeta('lastPrice');
  GeneratedRealColumn _lastPrice;
  @override
  GeneratedRealColumn get lastPrice => _lastPrice ??= _constructLastPrice();
  GeneratedRealColumn _constructLastPrice() {
    return GeneratedRealColumn(
      'last_price',
      $tableName,
      false,
    );
  }

  final VerificationMeta _netChangeMeta = const VerificationMeta('netChange');
  GeneratedRealColumn _netChange;
  @override
  GeneratedRealColumn get netChange => _netChange ??= _constructNetChange();
  GeneratedRealColumn _constructNetChange() {
    return GeneratedRealColumn(
      'net_change',
      $tableName,
      false,
    );
  }

  final VerificationMeta _percentageChangeMeta =
      const VerificationMeta('percentageChange');
  GeneratedRealColumn _percentageChange;
  @override
  GeneratedRealColumn get percentageChange =>
      _percentageChange ??= _constructPercentageChange();
  GeneratedRealColumn _constructPercentageChange() {
    return GeneratedRealColumn(
      'percentage_change',
      $tableName,
      false,
    );
  }

  final VerificationMeta _fiftyTwoWeekHighMeta =
      const VerificationMeta('fiftyTwoWeekHigh');
  GeneratedRealColumn _fiftyTwoWeekHigh;
  @override
  GeneratedRealColumn get fiftyTwoWeekHigh =>
      _fiftyTwoWeekHigh ??= _constructFiftyTwoWeekHigh();
  GeneratedRealColumn _constructFiftyTwoWeekHigh() {
    return GeneratedRealColumn(
      'fifty_two_week_high',
      $tableName,
      false,
    );
  }

  final VerificationMeta _fiftyTwoWeekLowMeta =
      const VerificationMeta('fiftyTwoWeekLow');
  GeneratedRealColumn _fiftyTwoWeekLow;
  @override
  GeneratedRealColumn get fiftyTwoWeekLow =>
      _fiftyTwoWeekLow ??= _constructFiftyTwoWeekLow();
  GeneratedRealColumn _constructFiftyTwoWeekLow() {
    return GeneratedRealColumn(
      'fifty_two_week_low',
      $tableName,
      false,
    );
  }

  final VerificationMeta _volumeMeta = const VerificationMeta('volume');
  GeneratedIntColumn _volume;
  @override
  GeneratedIntColumn get volume => _volume ??= _constructVolume();
  GeneratedIntColumn _constructVolume() {
    return GeneratedIntColumn(
      'volume',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        symbol,
        name,
        exchange,
        lastPrice,
        netChange,
        percentageChange,
        fiftyTwoWeekHigh,
        fiftyTwoWeekLow,
        volume
      ];
  @override
  $MarketIndexTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'market_index';
  @override
  final String actualTableName = 'market_index';
  @override
  VerificationContext validateIntegrity(Insertable<MarketIndexData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('symbol')) {
      context.handle(_symbolMeta,
          symbol.isAcceptableOrUnknown(data['symbol'], _symbolMeta));
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('exchange')) {
      context.handle(_exchangeMeta,
          exchange.isAcceptableOrUnknown(data['exchange'], _exchangeMeta));
    } else if (isInserting) {
      context.missing(_exchangeMeta);
    }
    if (data.containsKey('last_price')) {
      context.handle(_lastPriceMeta,
          lastPrice.isAcceptableOrUnknown(data['last_price'], _lastPriceMeta));
    } else if (isInserting) {
      context.missing(_lastPriceMeta);
    }
    if (data.containsKey('net_change')) {
      context.handle(_netChangeMeta,
          netChange.isAcceptableOrUnknown(data['net_change'], _netChangeMeta));
    } else if (isInserting) {
      context.missing(_netChangeMeta);
    }
    if (data.containsKey('percentage_change')) {
      context.handle(
          _percentageChangeMeta,
          percentageChange.isAcceptableOrUnknown(
              data['percentage_change'], _percentageChangeMeta));
    } else if (isInserting) {
      context.missing(_percentageChangeMeta);
    }
    if (data.containsKey('fifty_two_week_high')) {
      context.handle(
          _fiftyTwoWeekHighMeta,
          fiftyTwoWeekHigh.isAcceptableOrUnknown(
              data['fifty_two_week_high'], _fiftyTwoWeekHighMeta));
    } else if (isInserting) {
      context.missing(_fiftyTwoWeekHighMeta);
    }
    if (data.containsKey('fifty_two_week_low')) {
      context.handle(
          _fiftyTwoWeekLowMeta,
          fiftyTwoWeekLow.isAcceptableOrUnknown(
              data['fifty_two_week_low'], _fiftyTwoWeekLowMeta));
    } else if (isInserting) {
      context.missing(_fiftyTwoWeekLowMeta);
    }
    if (data.containsKey('volume')) {
      context.handle(_volumeMeta,
          volume.isAcceptableOrUnknown(data['volume'], _volumeMeta));
    } else if (isInserting) {
      context.missing(_volumeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {symbol};
  @override
  MarketIndexData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MarketIndexData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MarketIndexTable createAlias(String alias) {
    return $MarketIndexTable(_db, alias);
  }
}

class QuoteHistoryData extends DataClass
    implements Insertable<QuoteHistoryData> {
  final String symbol;
  final HistoryRecords records;
  QuoteHistoryData({@required this.symbol, @required this.records});
  factory QuoteHistoryData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return QuoteHistoryData(
      symbol:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}symbol']),
      records: $QuoteHistoryTable.$converter0.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}records'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || symbol != null) {
      map['symbol'] = Variable<String>(symbol);
    }
    if (!nullToAbsent || records != null) {
      final converter = $QuoteHistoryTable.$converter0;
      map['records'] = Variable<String>(converter.mapToSql(records));
    }
    return map;
  }

  QuoteHistoryCompanion toCompanion(bool nullToAbsent) {
    return QuoteHistoryCompanion(
      symbol:
          symbol == null && nullToAbsent ? const Value.absent() : Value(symbol),
      records: records == null && nullToAbsent
          ? const Value.absent()
          : Value(records),
    );
  }

  factory QuoteHistoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return QuoteHistoryData(
      symbol: serializer.fromJson<String>(json['symbol']),
      records: serializer.fromJson<HistoryRecords>(json['records']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'symbol': serializer.toJson<String>(symbol),
      'records': serializer.toJson<HistoryRecords>(records),
    };
  }

  QuoteHistoryData copyWith({String symbol, HistoryRecords records}) =>
      QuoteHistoryData(
        symbol: symbol ?? this.symbol,
        records: records ?? this.records,
      );
  @override
  String toString() {
    return (StringBuffer('QuoteHistoryData(')
          ..write('symbol: $symbol, ')
          ..write('records: $records')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(symbol.hashCode, records.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is QuoteHistoryData &&
          other.symbol == this.symbol &&
          other.records == this.records);
}

class QuoteHistoryCompanion extends UpdateCompanion<QuoteHistoryData> {
  final Value<String> symbol;
  final Value<HistoryRecords> records;
  const QuoteHistoryCompanion({
    this.symbol = const Value.absent(),
    this.records = const Value.absent(),
  });
  QuoteHistoryCompanion.insert({
    @required String symbol,
    @required HistoryRecords records,
  })  : symbol = Value(symbol),
        records = Value(records);
  static Insertable<QuoteHistoryData> custom({
    Expression<String> symbol,
    Expression<String> records,
  }) {
    return RawValuesInsertable({
      if (symbol != null) 'symbol': symbol,
      if (records != null) 'records': records,
    });
  }

  QuoteHistoryCompanion copyWith(
      {Value<String> symbol, Value<HistoryRecords> records}) {
    return QuoteHistoryCompanion(
      symbol: symbol ?? this.symbol,
      records: records ?? this.records,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (records.present) {
      final converter = $QuoteHistoryTable.$converter0;
      map['records'] = Variable<String>(converter.mapToSql(records.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuoteHistoryCompanion(')
          ..write('symbol: $symbol, ')
          ..write('records: $records')
          ..write(')'))
        .toString();
  }
}

class $QuoteHistoryTable extends QuoteHistory
    with TableInfo<$QuoteHistoryTable, QuoteHistoryData> {
  final GeneratedDatabase _db;
  final String _alias;
  $QuoteHistoryTable(this._db, [this._alias]);
  final VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  GeneratedTextColumn _symbol;
  @override
  GeneratedTextColumn get symbol => _symbol ??= _constructSymbol();
  GeneratedTextColumn _constructSymbol() {
    return GeneratedTextColumn('symbol', $tableName, false,
        minTextLength: 1, maxTextLength: 10);
  }

  final VerificationMeta _recordsMeta = const VerificationMeta('records');
  GeneratedTextColumn _records;
  @override
  GeneratedTextColumn get records => _records ??= _constructRecords();
  GeneratedTextColumn _constructRecords() {
    return GeneratedTextColumn(
      'records',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [symbol, records];
  @override
  $QuoteHistoryTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'quote_history';
  @override
  final String actualTableName = 'quote_history';
  @override
  VerificationContext validateIntegrity(Insertable<QuoteHistoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('symbol')) {
      context.handle(_symbolMeta,
          symbol.isAcceptableOrUnknown(data['symbol'], _symbolMeta));
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    context.handle(_recordsMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {symbol};
  @override
  QuoteHistoryData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return QuoteHistoryData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $QuoteHistoryTable createAlias(String alias) {
    return $QuoteHistoryTable(_db, alias);
  }

  static TypeConverter<HistoryRecords, String> $converter0 =
      const HistoryRecordsConverter();
}

class PositionItemData extends DataClass
    implements Insertable<PositionItemData> {
  final int id;
  final String symbol;
  final String name;
  final double lastPrice;
  final double entryPrice;
  final int size;
  final int positionType;
  PositionItemData(
      {@required this.id,
      @required this.symbol,
      @required this.name,
      @required this.lastPrice,
      @required this.entryPrice,
      @required this.size,
      @required this.positionType});
  factory PositionItemData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return PositionItemData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      symbol:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}symbol']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      lastPrice: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_price']),
      entryPrice: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}entry_price']),
      size: intType.mapFromDatabaseResponse(data['${effectivePrefix}size']),
      positionType: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}position_type']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || symbol != null) {
      map['symbol'] = Variable<String>(symbol);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || lastPrice != null) {
      map['last_price'] = Variable<double>(lastPrice);
    }
    if (!nullToAbsent || entryPrice != null) {
      map['entry_price'] = Variable<double>(entryPrice);
    }
    if (!nullToAbsent || size != null) {
      map['size'] = Variable<int>(size);
    }
    if (!nullToAbsent || positionType != null) {
      map['position_type'] = Variable<int>(positionType);
    }
    return map;
  }

  PositionItemCompanion toCompanion(bool nullToAbsent) {
    return PositionItemCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      symbol:
          symbol == null && nullToAbsent ? const Value.absent() : Value(symbol),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      lastPrice: lastPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPrice),
      entryPrice: entryPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(entryPrice),
      size: size == null && nullToAbsent ? const Value.absent() : Value(size),
      positionType: positionType == null && nullToAbsent
          ? const Value.absent()
          : Value(positionType),
    );
  }

  factory PositionItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PositionItemData(
      id: serializer.fromJson<int>(json['id']),
      symbol: serializer.fromJson<String>(json['symbol']),
      name: serializer.fromJson<String>(json['name']),
      lastPrice: serializer.fromJson<double>(json['lastPrice']),
      entryPrice: serializer.fromJson<double>(json['entryPrice']),
      size: serializer.fromJson<int>(json['size']),
      positionType: serializer.fromJson<int>(json['positionType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'symbol': serializer.toJson<String>(symbol),
      'name': serializer.toJson<String>(name),
      'lastPrice': serializer.toJson<double>(lastPrice),
      'entryPrice': serializer.toJson<double>(entryPrice),
      'size': serializer.toJson<int>(size),
      'positionType': serializer.toJson<int>(positionType),
    };
  }

  PositionItemData copyWith(
          {int id,
          String symbol,
          String name,
          double lastPrice,
          double entryPrice,
          int size,
          int positionType}) =>
      PositionItemData(
        id: id ?? this.id,
        symbol: symbol ?? this.symbol,
        name: name ?? this.name,
        lastPrice: lastPrice ?? this.lastPrice,
        entryPrice: entryPrice ?? this.entryPrice,
        size: size ?? this.size,
        positionType: positionType ?? this.positionType,
      );
  @override
  String toString() {
    return (StringBuffer('PositionItemData(')
          ..write('id: $id, ')
          ..write('symbol: $symbol, ')
          ..write('name: $name, ')
          ..write('lastPrice: $lastPrice, ')
          ..write('entryPrice: $entryPrice, ')
          ..write('size: $size, ')
          ..write('positionType: $positionType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          symbol.hashCode,
          $mrjc(
              name.hashCode,
              $mrjc(
                  lastPrice.hashCode,
                  $mrjc(entryPrice.hashCode,
                      $mrjc(size.hashCode, positionType.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is PositionItemData &&
          other.id == this.id &&
          other.symbol == this.symbol &&
          other.name == this.name &&
          other.lastPrice == this.lastPrice &&
          other.entryPrice == this.entryPrice &&
          other.size == this.size &&
          other.positionType == this.positionType);
}

class PositionItemCompanion extends UpdateCompanion<PositionItemData> {
  final Value<int> id;
  final Value<String> symbol;
  final Value<String> name;
  final Value<double> lastPrice;
  final Value<double> entryPrice;
  final Value<int> size;
  final Value<int> positionType;
  const PositionItemCompanion({
    this.id = const Value.absent(),
    this.symbol = const Value.absent(),
    this.name = const Value.absent(),
    this.lastPrice = const Value.absent(),
    this.entryPrice = const Value.absent(),
    this.size = const Value.absent(),
    this.positionType = const Value.absent(),
  });
  PositionItemCompanion.insert({
    this.id = const Value.absent(),
    @required String symbol,
    @required String name,
    @required double lastPrice,
    @required double entryPrice,
    @required int size,
    @required int positionType,
  })  : symbol = Value(symbol),
        name = Value(name),
        lastPrice = Value(lastPrice),
        entryPrice = Value(entryPrice),
        size = Value(size),
        positionType = Value(positionType);
  static Insertable<PositionItemData> custom({
    Expression<int> id,
    Expression<String> symbol,
    Expression<String> name,
    Expression<double> lastPrice,
    Expression<double> entryPrice,
    Expression<int> size,
    Expression<int> positionType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (symbol != null) 'symbol': symbol,
      if (name != null) 'name': name,
      if (lastPrice != null) 'last_price': lastPrice,
      if (entryPrice != null) 'entry_price': entryPrice,
      if (size != null) 'size': size,
      if (positionType != null) 'position_type': positionType,
    });
  }

  PositionItemCompanion copyWith(
      {Value<int> id,
      Value<String> symbol,
      Value<String> name,
      Value<double> lastPrice,
      Value<double> entryPrice,
      Value<int> size,
      Value<int> positionType}) {
    return PositionItemCompanion(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      lastPrice: lastPrice ?? this.lastPrice,
      entryPrice: entryPrice ?? this.entryPrice,
      size: size ?? this.size,
      positionType: positionType ?? this.positionType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lastPrice.present) {
      map['last_price'] = Variable<double>(lastPrice.value);
    }
    if (entryPrice.present) {
      map['entry_price'] = Variable<double>(entryPrice.value);
    }
    if (size.present) {
      map['size'] = Variable<int>(size.value);
    }
    if (positionType.present) {
      map['position_type'] = Variable<int>(positionType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PositionItemCompanion(')
          ..write('id: $id, ')
          ..write('symbol: $symbol, ')
          ..write('name: $name, ')
          ..write('lastPrice: $lastPrice, ')
          ..write('entryPrice: $entryPrice, ')
          ..write('size: $size, ')
          ..write('positionType: $positionType')
          ..write(')'))
        .toString();
  }
}

class $PositionItemTable extends PositionItem
    with TableInfo<$PositionItemTable, PositionItemData> {
  final GeneratedDatabase _db;
  final String _alias;
  $PositionItemTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  GeneratedTextColumn _symbol;
  @override
  GeneratedTextColumn get symbol => _symbol ??= _constructSymbol();
  GeneratedTextColumn _constructSymbol() {
    return GeneratedTextColumn('symbol', $tableName, false,
        minTextLength: 1, maxTextLength: 10);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _lastPriceMeta = const VerificationMeta('lastPrice');
  GeneratedRealColumn _lastPrice;
  @override
  GeneratedRealColumn get lastPrice => _lastPrice ??= _constructLastPrice();
  GeneratedRealColumn _constructLastPrice() {
    return GeneratedRealColumn(
      'last_price',
      $tableName,
      false,
    );
  }

  final VerificationMeta _entryPriceMeta = const VerificationMeta('entryPrice');
  GeneratedRealColumn _entryPrice;
  @override
  GeneratedRealColumn get entryPrice => _entryPrice ??= _constructEntryPrice();
  GeneratedRealColumn _constructEntryPrice() {
    return GeneratedRealColumn(
      'entry_price',
      $tableName,
      false,
    );
  }

  final VerificationMeta _sizeMeta = const VerificationMeta('size');
  GeneratedIntColumn _size;
  @override
  GeneratedIntColumn get size => _size ??= _constructSize();
  GeneratedIntColumn _constructSize() {
    return GeneratedIntColumn(
      'size',
      $tableName,
      false,
    );
  }

  final VerificationMeta _positionTypeMeta =
      const VerificationMeta('positionType');
  GeneratedIntColumn _positionType;
  @override
  GeneratedIntColumn get positionType =>
      _positionType ??= _constructPositionType();
  GeneratedIntColumn _constructPositionType() {
    return GeneratedIntColumn(
      'position_type',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, symbol, name, lastPrice, entryPrice, size, positionType];
  @override
  $PositionItemTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'position_item';
  @override
  final String actualTableName = 'position_item';
  @override
  VerificationContext validateIntegrity(Insertable<PositionItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('symbol')) {
      context.handle(_symbolMeta,
          symbol.isAcceptableOrUnknown(data['symbol'], _symbolMeta));
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('last_price')) {
      context.handle(_lastPriceMeta,
          lastPrice.isAcceptableOrUnknown(data['last_price'], _lastPriceMeta));
    } else if (isInserting) {
      context.missing(_lastPriceMeta);
    }
    if (data.containsKey('entry_price')) {
      context.handle(
          _entryPriceMeta,
          entryPrice.isAcceptableOrUnknown(
              data['entry_price'], _entryPriceMeta));
    } else if (isInserting) {
      context.missing(_entryPriceMeta);
    }
    if (data.containsKey('size')) {
      context.handle(
          _sizeMeta, size.isAcceptableOrUnknown(data['size'], _sizeMeta));
    } else if (isInserting) {
      context.missing(_sizeMeta);
    }
    if (data.containsKey('position_type')) {
      context.handle(
          _positionTypeMeta,
          positionType.isAcceptableOrUnknown(
              data['position_type'], _positionTypeMeta));
    } else if (isInserting) {
      context.missing(_positionTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PositionItemData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return PositionItemData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PositionItemTable createAlias(String alias) {
    return $PositionItemTable(_db, alias);
  }
}

class WatchlistItemData extends DataClass
    implements Insertable<WatchlistItemData> {
  final String symbol;
  final String name;
  final double lastPrice;
  final double netChange;
  final double percentageChange;
  WatchlistItemData(
      {@required this.symbol,
      @required this.name,
      @required this.lastPrice,
      @required this.netChange,
      @required this.percentageChange});
  factory WatchlistItemData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return WatchlistItemData(
      symbol:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}symbol']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      lastPrice: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_price']),
      netChange: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}net_change']),
      percentageChange: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}percentage_change']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || symbol != null) {
      map['symbol'] = Variable<String>(symbol);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || lastPrice != null) {
      map['last_price'] = Variable<double>(lastPrice);
    }
    if (!nullToAbsent || netChange != null) {
      map['net_change'] = Variable<double>(netChange);
    }
    if (!nullToAbsent || percentageChange != null) {
      map['percentage_change'] = Variable<double>(percentageChange);
    }
    return map;
  }

  WatchlistItemCompanion toCompanion(bool nullToAbsent) {
    return WatchlistItemCompanion(
      symbol:
          symbol == null && nullToAbsent ? const Value.absent() : Value(symbol),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      lastPrice: lastPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPrice),
      netChange: netChange == null && nullToAbsent
          ? const Value.absent()
          : Value(netChange),
      percentageChange: percentageChange == null && nullToAbsent
          ? const Value.absent()
          : Value(percentageChange),
    );
  }

  factory WatchlistItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return WatchlistItemData(
      symbol: serializer.fromJson<String>(json['symbol']),
      name: serializer.fromJson<String>(json['name']),
      lastPrice: serializer.fromJson<double>(json['lastPrice']),
      netChange: serializer.fromJson<double>(json['netChange']),
      percentageChange: serializer.fromJson<double>(json['percentageChange']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'symbol': serializer.toJson<String>(symbol),
      'name': serializer.toJson<String>(name),
      'lastPrice': serializer.toJson<double>(lastPrice),
      'netChange': serializer.toJson<double>(netChange),
      'percentageChange': serializer.toJson<double>(percentageChange),
    };
  }

  WatchlistItemData copyWith(
          {String symbol,
          String name,
          double lastPrice,
          double netChange,
          double percentageChange}) =>
      WatchlistItemData(
        symbol: symbol ?? this.symbol,
        name: name ?? this.name,
        lastPrice: lastPrice ?? this.lastPrice,
        netChange: netChange ?? this.netChange,
        percentageChange: percentageChange ?? this.percentageChange,
      );
  @override
  String toString() {
    return (StringBuffer('WatchlistItemData(')
          ..write('symbol: $symbol, ')
          ..write('name: $name, ')
          ..write('lastPrice: $lastPrice, ')
          ..write('netChange: $netChange, ')
          ..write('percentageChange: $percentageChange')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      symbol.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(lastPrice.hashCode,
              $mrjc(netChange.hashCode, percentageChange.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is WatchlistItemData &&
          other.symbol == this.symbol &&
          other.name == this.name &&
          other.lastPrice == this.lastPrice &&
          other.netChange == this.netChange &&
          other.percentageChange == this.percentageChange);
}

class WatchlistItemCompanion extends UpdateCompanion<WatchlistItemData> {
  final Value<String> symbol;
  final Value<String> name;
  final Value<double> lastPrice;
  final Value<double> netChange;
  final Value<double> percentageChange;
  const WatchlistItemCompanion({
    this.symbol = const Value.absent(),
    this.name = const Value.absent(),
    this.lastPrice = const Value.absent(),
    this.netChange = const Value.absent(),
    this.percentageChange = const Value.absent(),
  });
  WatchlistItemCompanion.insert({
    @required String symbol,
    @required String name,
    @required double lastPrice,
    @required double netChange,
    @required double percentageChange,
  })  : symbol = Value(symbol),
        name = Value(name),
        lastPrice = Value(lastPrice),
        netChange = Value(netChange),
        percentageChange = Value(percentageChange);
  static Insertable<WatchlistItemData> custom({
    Expression<String> symbol,
    Expression<String> name,
    Expression<double> lastPrice,
    Expression<double> netChange,
    Expression<double> percentageChange,
  }) {
    return RawValuesInsertable({
      if (symbol != null) 'symbol': symbol,
      if (name != null) 'name': name,
      if (lastPrice != null) 'last_price': lastPrice,
      if (netChange != null) 'net_change': netChange,
      if (percentageChange != null) 'percentage_change': percentageChange,
    });
  }

  WatchlistItemCompanion copyWith(
      {Value<String> symbol,
      Value<String> name,
      Value<double> lastPrice,
      Value<double> netChange,
      Value<double> percentageChange}) {
    return WatchlistItemCompanion(
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      lastPrice: lastPrice ?? this.lastPrice,
      netChange: netChange ?? this.netChange,
      percentageChange: percentageChange ?? this.percentageChange,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lastPrice.present) {
      map['last_price'] = Variable<double>(lastPrice.value);
    }
    if (netChange.present) {
      map['net_change'] = Variable<double>(netChange.value);
    }
    if (percentageChange.present) {
      map['percentage_change'] = Variable<double>(percentageChange.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WatchlistItemCompanion(')
          ..write('symbol: $symbol, ')
          ..write('name: $name, ')
          ..write('lastPrice: $lastPrice, ')
          ..write('netChange: $netChange, ')
          ..write('percentageChange: $percentageChange')
          ..write(')'))
        .toString();
  }
}

class $WatchlistItemTable extends WatchlistItem
    with TableInfo<$WatchlistItemTable, WatchlistItemData> {
  final GeneratedDatabase _db;
  final String _alias;
  $WatchlistItemTable(this._db, [this._alias]);
  final VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  GeneratedTextColumn _symbol;
  @override
  GeneratedTextColumn get symbol => _symbol ??= _constructSymbol();
  GeneratedTextColumn _constructSymbol() {
    return GeneratedTextColumn('symbol', $tableName, false,
        minTextLength: 1, maxTextLength: 10);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _lastPriceMeta = const VerificationMeta('lastPrice');
  GeneratedRealColumn _lastPrice;
  @override
  GeneratedRealColumn get lastPrice => _lastPrice ??= _constructLastPrice();
  GeneratedRealColumn _constructLastPrice() {
    return GeneratedRealColumn(
      'last_price',
      $tableName,
      false,
    );
  }

  final VerificationMeta _netChangeMeta = const VerificationMeta('netChange');
  GeneratedRealColumn _netChange;
  @override
  GeneratedRealColumn get netChange => _netChange ??= _constructNetChange();
  GeneratedRealColumn _constructNetChange() {
    return GeneratedRealColumn(
      'net_change',
      $tableName,
      false,
    );
  }

  final VerificationMeta _percentageChangeMeta =
      const VerificationMeta('percentageChange');
  GeneratedRealColumn _percentageChange;
  @override
  GeneratedRealColumn get percentageChange =>
      _percentageChange ??= _constructPercentageChange();
  GeneratedRealColumn _constructPercentageChange() {
    return GeneratedRealColumn(
      'percentage_change',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [symbol, name, lastPrice, netChange, percentageChange];
  @override
  $WatchlistItemTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'watchlist_item';
  @override
  final String actualTableName = 'watchlist_item';
  @override
  VerificationContext validateIntegrity(Insertable<WatchlistItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('symbol')) {
      context.handle(_symbolMeta,
          symbol.isAcceptableOrUnknown(data['symbol'], _symbolMeta));
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('last_price')) {
      context.handle(_lastPriceMeta,
          lastPrice.isAcceptableOrUnknown(data['last_price'], _lastPriceMeta));
    } else if (isInserting) {
      context.missing(_lastPriceMeta);
    }
    if (data.containsKey('net_change')) {
      context.handle(_netChangeMeta,
          netChange.isAcceptableOrUnknown(data['net_change'], _netChangeMeta));
    } else if (isInserting) {
      context.missing(_netChangeMeta);
    }
    if (data.containsKey('percentage_change')) {
      context.handle(
          _percentageChangeMeta,
          percentageChange.isAcceptableOrUnknown(
              data['percentage_change'], _percentageChangeMeta));
    } else if (isInserting) {
      context.missing(_percentageChangeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {symbol};
  @override
  WatchlistItemData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return WatchlistItemData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $WatchlistItemTable createAlias(String alias) {
    return $WatchlistItemTable(_db, alias);
  }
}

class StockDataDetail extends DataClass implements Insertable<StockDataDetail> {
  final String symbol;
  final StockDataRecords records;
  StockDataDetail({@required this.symbol, @required this.records});
  factory StockDataDetail.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return StockDataDetail(
      symbol:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}symbol']),
      records: $StockDataDetailsTable.$converter0.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}records'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || symbol != null) {
      map['symbol'] = Variable<String>(symbol);
    }
    if (!nullToAbsent || records != null) {
      final converter = $StockDataDetailsTable.$converter0;
      map['records'] = Variable<String>(converter.mapToSql(records));
    }
    return map;
  }

  StockDataDetailsCompanion toCompanion(bool nullToAbsent) {
    return StockDataDetailsCompanion(
      symbol:
          symbol == null && nullToAbsent ? const Value.absent() : Value(symbol),
      records: records == null && nullToAbsent
          ? const Value.absent()
          : Value(records),
    );
  }

  factory StockDataDetail.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return StockDataDetail(
      symbol: serializer.fromJson<String>(json['symbol']),
      records: serializer.fromJson<StockDataRecords>(json['records']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'symbol': serializer.toJson<String>(symbol),
      'records': serializer.toJson<StockDataRecords>(records),
    };
  }

  StockDataDetail copyWith({String symbol, StockDataRecords records}) =>
      StockDataDetail(
        symbol: symbol ?? this.symbol,
        records: records ?? this.records,
      );
  @override
  String toString() {
    return (StringBuffer('StockDataDetail(')
          ..write('symbol: $symbol, ')
          ..write('records: $records')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(symbol.hashCode, records.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is StockDataDetail &&
          other.symbol == this.symbol &&
          other.records == this.records);
}

class StockDataDetailsCompanion extends UpdateCompanion<StockDataDetail> {
  final Value<String> symbol;
  final Value<StockDataRecords> records;
  const StockDataDetailsCompanion({
    this.symbol = const Value.absent(),
    this.records = const Value.absent(),
  });
  StockDataDetailsCompanion.insert({
    @required String symbol,
    @required StockDataRecords records,
  })  : symbol = Value(symbol),
        records = Value(records);
  static Insertable<StockDataDetail> custom({
    Expression<String> symbol,
    Expression<String> records,
  }) {
    return RawValuesInsertable({
      if (symbol != null) 'symbol': symbol,
      if (records != null) 'records': records,
    });
  }

  StockDataDetailsCompanion copyWith(
      {Value<String> symbol, Value<StockDataRecords> records}) {
    return StockDataDetailsCompanion(
      symbol: symbol ?? this.symbol,
      records: records ?? this.records,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (records.present) {
      final converter = $StockDataDetailsTable.$converter0;
      map['records'] = Variable<String>(converter.mapToSql(records.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StockDataDetailsCompanion(')
          ..write('symbol: $symbol, ')
          ..write('records: $records')
          ..write(')'))
        .toString();
  }
}

class $StockDataDetailsTable extends StockDataDetails
    with TableInfo<$StockDataDetailsTable, StockDataDetail> {
  final GeneratedDatabase _db;
  final String _alias;
  $StockDataDetailsTable(this._db, [this._alias]);
  final VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  GeneratedTextColumn _symbol;
  @override
  GeneratedTextColumn get symbol => _symbol ??= _constructSymbol();
  GeneratedTextColumn _constructSymbol() {
    return GeneratedTextColumn('symbol', $tableName, false,
        minTextLength: 1, maxTextLength: 10);
  }

  final VerificationMeta _recordsMeta = const VerificationMeta('records');
  GeneratedTextColumn _records;
  @override
  GeneratedTextColumn get records => _records ??= _constructRecords();
  GeneratedTextColumn _constructRecords() {
    return GeneratedTextColumn(
      'records',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [symbol, records];
  @override
  $StockDataDetailsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'stock_data_details';
  @override
  final String actualTableName = 'stock_data_details';
  @override
  VerificationContext validateIntegrity(Insertable<StockDataDetail> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('symbol')) {
      context.handle(_symbolMeta,
          symbol.isAcceptableOrUnknown(data['symbol'], _symbolMeta));
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    context.handle(_recordsMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {symbol};
  @override
  StockDataDetail map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return StockDataDetail.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $StockDataDetailsTable createAlias(String alias) {
    return $StockDataDetailsTable(_db, alias);
  }

  static TypeConverter<StockDataRecords, String> $converter0 =
      const StockDataRecordsConverter();
}

class PortfolioData extends DataClass implements Insertable<PortfolioData> {
  final int id;
  final double openPositionsPL;
  final double closedPositionsPL;
  PortfolioData(
      {@required this.id,
      @required this.openPositionsPL,
      @required this.closedPositionsPL});
  factory PortfolioData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    return PortfolioData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      openPositionsPL: doubleType.mapFromDatabaseResponse(
          data['${effectivePrefix}open_positions_p_l']),
      closedPositionsPL: doubleType.mapFromDatabaseResponse(
          data['${effectivePrefix}closed_positions_p_l']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || openPositionsPL != null) {
      map['open_positions_p_l'] = Variable<double>(openPositionsPL);
    }
    if (!nullToAbsent || closedPositionsPL != null) {
      map['closed_positions_p_l'] = Variable<double>(closedPositionsPL);
    }
    return map;
  }

  PortfolioCompanion toCompanion(bool nullToAbsent) {
    return PortfolioCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      openPositionsPL: openPositionsPL == null && nullToAbsent
          ? const Value.absent()
          : Value(openPositionsPL),
      closedPositionsPL: closedPositionsPL == null && nullToAbsent
          ? const Value.absent()
          : Value(closedPositionsPL),
    );
  }

  factory PortfolioData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PortfolioData(
      id: serializer.fromJson<int>(json['id']),
      openPositionsPL: serializer.fromJson<double>(json['openPositionsPL']),
      closedPositionsPL: serializer.fromJson<double>(json['closedPositionsPL']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'openPositionsPL': serializer.toJson<double>(openPositionsPL),
      'closedPositionsPL': serializer.toJson<double>(closedPositionsPL),
    };
  }

  PortfolioData copyWith(
          {int id, double openPositionsPL, double closedPositionsPL}) =>
      PortfolioData(
        id: id ?? this.id,
        openPositionsPL: openPositionsPL ?? this.openPositionsPL,
        closedPositionsPL: closedPositionsPL ?? this.closedPositionsPL,
      );
  @override
  String toString() {
    return (StringBuffer('PortfolioData(')
          ..write('id: $id, ')
          ..write('openPositionsPL: $openPositionsPL, ')
          ..write('closedPositionsPL: $closedPositionsPL')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(openPositionsPL.hashCode, closedPositionsPL.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is PortfolioData &&
          other.id == this.id &&
          other.openPositionsPL == this.openPositionsPL &&
          other.closedPositionsPL == this.closedPositionsPL);
}

class PortfolioCompanion extends UpdateCompanion<PortfolioData> {
  final Value<int> id;
  final Value<double> openPositionsPL;
  final Value<double> closedPositionsPL;
  const PortfolioCompanion({
    this.id = const Value.absent(),
    this.openPositionsPL = const Value.absent(),
    this.closedPositionsPL = const Value.absent(),
  });
  PortfolioCompanion.insert({
    this.id = const Value.absent(),
    @required double openPositionsPL,
    @required double closedPositionsPL,
  })  : openPositionsPL = Value(openPositionsPL),
        closedPositionsPL = Value(closedPositionsPL);
  static Insertable<PortfolioData> custom({
    Expression<int> id,
    Expression<double> openPositionsPL,
    Expression<double> closedPositionsPL,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (openPositionsPL != null) 'open_positions_p_l': openPositionsPL,
      if (closedPositionsPL != null) 'closed_positions_p_l': closedPositionsPL,
    });
  }

  PortfolioCompanion copyWith(
      {Value<int> id,
      Value<double> openPositionsPL,
      Value<double> closedPositionsPL}) {
    return PortfolioCompanion(
      id: id ?? this.id,
      openPositionsPL: openPositionsPL ?? this.openPositionsPL,
      closedPositionsPL: closedPositionsPL ?? this.closedPositionsPL,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (openPositionsPL.present) {
      map['open_positions_p_l'] = Variable<double>(openPositionsPL.value);
    }
    if (closedPositionsPL.present) {
      map['closed_positions_p_l'] = Variable<double>(closedPositionsPL.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PortfolioCompanion(')
          ..write('id: $id, ')
          ..write('openPositionsPL: $openPositionsPL, ')
          ..write('closedPositionsPL: $closedPositionsPL')
          ..write(')'))
        .toString();
  }
}

class $PortfolioTable extends Portfolio
    with TableInfo<$PortfolioTable, PortfolioData> {
  final GeneratedDatabase _db;
  final String _alias;
  $PortfolioTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _openPositionsPLMeta =
      const VerificationMeta('openPositionsPL');
  GeneratedRealColumn _openPositionsPL;
  @override
  GeneratedRealColumn get openPositionsPL =>
      _openPositionsPL ??= _constructOpenPositionsPL();
  GeneratedRealColumn _constructOpenPositionsPL() {
    return GeneratedRealColumn(
      'open_positions_p_l',
      $tableName,
      false,
    );
  }

  final VerificationMeta _closedPositionsPLMeta =
      const VerificationMeta('closedPositionsPL');
  GeneratedRealColumn _closedPositionsPL;
  @override
  GeneratedRealColumn get closedPositionsPL =>
      _closedPositionsPL ??= _constructClosedPositionsPL();
  GeneratedRealColumn _constructClosedPositionsPL() {
    return GeneratedRealColumn(
      'closed_positions_p_l',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, openPositionsPL, closedPositionsPL];
  @override
  $PortfolioTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'portfolio';
  @override
  final String actualTableName = 'portfolio';
  @override
  VerificationContext validateIntegrity(Insertable<PortfolioData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('open_positions_p_l')) {
      context.handle(
          _openPositionsPLMeta,
          openPositionsPL.isAcceptableOrUnknown(
              data['open_positions_p_l'], _openPositionsPLMeta));
    } else if (isInserting) {
      context.missing(_openPositionsPLMeta);
    }
    if (data.containsKey('closed_positions_p_l')) {
      context.handle(
          _closedPositionsPLMeta,
          closedPositionsPL.isAcceptableOrUnknown(
              data['closed_positions_p_l'], _closedPositionsPLMeta));
    } else if (isInserting) {
      context.missing(_closedPositionsPLMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PortfolioData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return PortfolioData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PortfolioTable createAlias(String alias) {
    return $PortfolioTable(_db, alias);
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $MarketIndexTable _marketIndex;
  $MarketIndexTable get marketIndex => _marketIndex ??= $MarketIndexTable(this);
  $QuoteHistoryTable _quoteHistory;
  $QuoteHistoryTable get quoteHistory =>
      _quoteHistory ??= $QuoteHistoryTable(this);
  $PositionItemTable _positionItem;
  $PositionItemTable get positionItem =>
      _positionItem ??= $PositionItemTable(this);
  $WatchlistItemTable _watchlistItem;
  $WatchlistItemTable get watchlistItem =>
      _watchlistItem ??= $WatchlistItemTable(this);
  $StockDataDetailsTable _stockDataDetails;
  $StockDataDetailsTable get stockDataDetails =>
      _stockDataDetails ??= $StockDataDetailsTable(this);
  $PortfolioTable _portfolio;
  $PortfolioTable get portfolio => _portfolio ??= $PortfolioTable(this);
  MarketDataDao _marketDataDao;
  MarketDataDao get marketDataDao =>
      _marketDataDao ??= MarketDataDao(this as LocalDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        marketIndex,
        quoteHistory,
        positionItem,
        watchlistItem,
        stockDataDetails,
        portfolio
      ];
}
