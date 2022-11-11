import 'package:ceiba/infrastructure/database/database.provider.dart';
import 'package:ceiba/infrastructure/database/persisten.entity.dart';
import 'package:sqflite/sqflite.dart';

class DBRepository<T extends PersistenEntity> {
  static final _databaseProvider = DBProvider();
  String tableName;

  DBRepository(this.tableName);

  Future<void> save(T entity) async {
    final db = await _databaseProvider.database;
    await db.insert(
      tableName,
      entity.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Database> get database async {
    return await _databaseProvider.database;
  }
}