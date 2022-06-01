import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_todolist/login_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_todolist/notes_db.dart';

class Logindbhelper {
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDB('notes.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY';
    final textType = 'INTEGER NOT NULL';
    await db.execute(
        'CREATE TABLE $tableLogin(${login_fields.id} INTEGER PRIMARY KEY, ${login_fields.name} TEXT, ${login_fields.email} TEXT, ${login_fields.password} TEXT)');
  }

  Future<dynamic> save(Login login_data) async {
    var dbClient = await database;
    login_data.id = await dbClient.insert(tableLogin, login_data.toJson());
    print('Homepage data save============>>>>>>.....');
    return login_data;
  }

  Future<Login> readlogin(int id) async {
    final db = await database;
    final maps = await db.query(
      tableLogin,
      columns: login_fields.values,
      where: '${login_fields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Login.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Login>> readAlllogin() async {
    final db = await database;
    final orderBy = '${login_fields.id} ASC';
    final result = await db.query(tableLogin, orderBy: orderBy);
    return result.map((json) => Login.fromJson(json)).toList();
  }

  Future<int> update(Login login) async {
    final db = await database;
    return db.update(
      tableLogin,
      login.toJson(),
      where: '${login_fields.id} = ?',
      whereArgs: [login.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete(
      tableLogin,
      where: '${login_fields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
