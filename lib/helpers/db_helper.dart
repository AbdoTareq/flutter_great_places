import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  static Future<sql.Database> _getDb(String tableName) async {
    // db path
    final dbPath = await sql.getDatabasesPath();
    // create db if not exist or open it if exist
    return sql.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) {
      return db.execute(
          // REAL is like double for DB
          'CREATE TABLE $tableName(id TEXT PRIMARY KEY,title TEXT,image TEXT,lat REAL,lng REAL,address TEXT)');
    }, version: 1);
  }

  static Future<void> insert(String tableName, Map<String, Object> data) async {
    final sqlDb = await DBHelper._getDb(tableName);
    sqlDb.insert(tableName, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String tableName) async {
    final sqlDb = await DBHelper._getDb(tableName);
    return sqlDb.query(tableName);
  }
}
