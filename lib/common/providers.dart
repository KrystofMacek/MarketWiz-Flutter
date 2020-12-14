import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter_riverpod/all.dart';

final connectivityProvider = Provider<Connectivity>((ref) {
  return Connectivity();
});
