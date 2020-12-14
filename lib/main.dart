import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/all.dart';
import './ui/app.dart';
import 'package:logging/logging.dart';

main() {
  _setupLogging();
  runApp(ProviderScope(child: MarketWizApp()));
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
