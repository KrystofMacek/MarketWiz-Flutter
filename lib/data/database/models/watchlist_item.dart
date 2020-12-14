import 'package:moor/moor.dart';

class WatchlistItem extends Table {
  TextColumn get symbol => text().withLength(min: 1, max: 10)();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  RealColumn get lastPrice => real()();
  RealColumn get netChange => real()();
  RealColumn get percentageChange => real()();

  @override
  Set<Column> get primaryKey => {symbol};
}
