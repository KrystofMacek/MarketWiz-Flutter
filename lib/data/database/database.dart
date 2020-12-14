import './models/database_models.dart';
import './dao/dao.dart';
import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'database.g.dart';

final databaseProvider = Provider((ref) {
  print('Local Database provider');

  return LocalDatabase();
});

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [
  MarketIndex,
  QuoteHistory,
  PositionItem,
  WatchlistItem,
  StockDataDetails,
  Portfolio,
], daos: [
  MarketDataDao
])
class LocalDatabase extends _$LocalDatabase {
  // we tell the database where to store the data with this constructor
  LocalDatabase() : super(_openConnection());

  @override
  MigrationStrategy get migration => MigrationStrategy(
          // Runs if the database has already been opened on the device with a lower version
          onCreate: (Migrator m) {
        return m.createAll();
      }, onUpgrade: (Migrator m, int from, int to) async {
        for (DatabaseSchemaEntity table in this.allSchemaEntities) {
          m.drop(table);
        }
        return m.createAll();
      });

  @override
  int get schemaVersion => 11;
}
