import 'package:moor/moor.dart';

class MarketIndex extends Table {
  TextColumn get symbol => text().withLength(min: 1, max: 10)();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get exchange => text().withLength(min: 1, max: 50)();
  RealColumn get lastPrice => real()();
  RealColumn get netChange => real()();
  RealColumn get percentageChange => real()();
  RealColumn get fiftyTwoWeekHigh => real()();
  RealColumn get fiftyTwoWeekLow => real()();
  IntColumn get volume => integer()();

  @override
  Set<Column> get primaryKey => {symbol};
}
