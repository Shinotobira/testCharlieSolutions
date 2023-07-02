import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testcharliesolutions/core/material_app/main_material_app.dart';

import 'core/di/injection_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjectionDependencies();
  await createDatabase();
  runApp(
    DevicePreview(
      builder: (context) => const MainMaterialApp(),
    ),
  );
}

Future<void> createDatabase() async {
  String databasesPath = await getDatabasesPath();
  String dbPath = join(databasesPath, 'charlieSolutions.db');

  Database database = await openDatabase(
    dbPath,
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE user (id TEXT PRIMARY KEY,name TEXT,phoneNumber TEXT,address TEXT,image TEXT,email TEXT,age INTEGER)');
    },
  );

  await database.close();
}
