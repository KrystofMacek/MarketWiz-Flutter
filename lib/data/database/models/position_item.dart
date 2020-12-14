import 'package:moor/moor.dart';

class PositionItem extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get symbol => text().withLength(min: 1, max: 10)();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  RealColumn get lastPrice => real()();
  RealColumn get entryPrice => real()();
  IntColumn get size => integer()();
  IntColumn get positionType => integer()();
}
