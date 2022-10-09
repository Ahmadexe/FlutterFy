import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const String _dbName = "myDatabase.db";
  static const int _dbVersion = 1;
  static const String _tableName = "songs";
  static const String _columnId = "id";
  static const String _columnName = "name";
  static const String _columnUrl = "url";

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
   
  Future<Database?> get database async {
    _database = await _initializeDatabase();
    return _database;
  }

  _initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    db.execute('''
      CREATE TABLE If NOT EXISTS $_tableName($_columnId INTEGER PRIMARY KEY AUTOINCREMENT, $_columnName TEXT NOT NULL, $_columnUrl TEXT NOT NULL)
      ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(_tableName, row);
  }

  // Gets all the rows.
  Future<List<Map<String, dynamic>>> queryAll() async {
    Database? db = await instance.database;
    return db!.query(_tableName);
  }

  // It returns the number of rows in the database updated.
  Future<int> update(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = row[_columnId];
    return await db!
        .update(_tableName, row, where: '$_columnId = ?', whereArgs: [id]);
  }

  // Returns the number of rows affected.
  Future<int> delete(int id) async {
    Database? db = await instance.database;
    return await db!
        .delete(_tableName, where: '$_columnId = ?', whereArgs: [id]);
  }
}