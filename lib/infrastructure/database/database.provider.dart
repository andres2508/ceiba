import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider _db = DBProvider._internal();

  factory DBProvider() {
    return _db;
  }

  DBProvider._internal();

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDB();
    }
    return _database!;
  }

  Future<Database> initDB() async {
    final path = join(await getDatabasesPath(), 'ceiba.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          createDatabases(db);
        });
  }

  void createDatabases(Database db) {
    // User table
    db.execute('''
        CREATE TABLE Users(
          id INTEGER PRIMARY KEY,
          name TEXT,
          username TEXT,
          email TEXT,
          address TEXT,
          phone TEXT,
          website TEXT,
          company TEXT
        );
    ''');
  }
}