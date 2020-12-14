import 'package:moor/moor.dart';

class Portfolio extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get openPositionsPL => real()();
  RealColumn get closedPositionsPL => real()();
}
