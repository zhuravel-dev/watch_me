import 'package:hive_flutter/hive_flutter.dart';

import 'hive_adapter.dart';

class HiveDb {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MovieHiveModelAdapter());
    await _openBoxes();
  }

  static Future<void> _openBoxes() async {
    await Hive.openBox<int>('favorites');
  }
}
