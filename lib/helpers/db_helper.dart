import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) {
      db.execute(
          'create table user_places(id text primary key, title text, image text)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final database = await DBHelper.database();

    await database.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final database = await DBHelper.database();
    return database.query(table);
  }
}
