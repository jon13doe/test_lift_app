import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class HouseDatabaseHelper {
  static late Database _database;
  static const String tableName = 'houses';

  static Future<void> initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'house_database.db'),
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY,
            houseName TEXT,
            floors INTEGER
          )
          ''',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertHouse(String houseName, int floors) async {
    await _database.insert(
      tableName,
      {'houseName': houseName, 'floors': floors},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getAllHouses() async {
    return await _database.query(tableName);
  }

  static Future<void> clearAllHouses() async {
    await _database.delete(tableName, where: '1');
  }
  
}