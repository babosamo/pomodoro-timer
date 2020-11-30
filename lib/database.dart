
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'db/IssueItemDao.dart';
import 'model/IssueItem.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [IssueItem])
abstract class AppDatabase extends FloorDatabase {
  IssueItemDao get issueItemDao;

  static AppDatabase instance;
  static Future<AppDatabase> getInstance() async {
    if (instance == null)
      instance = await $FloorAppDatabase.inMemoryDatabaseBuilder().build();
    return instance;
  }
}
