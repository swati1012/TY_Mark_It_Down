import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_todolist/database/add_task_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_todolist/database/add_task.dart';

class TaskAddHelper {
  static Database _database;

  static var instance;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB('task.db');
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
        'CREATE TABLE $tableAddTask(${add_task.id} INTEGER PRIMARY KEY, ${add_task.task_name} TEXT, ${add_task.category} TEXT)');
  }

  Future<dynamic> save(Task task_list) async {
    var dbClient = await database;
    task_list.id = await dbClient.insert(tableAddTask, task_list.toJson());
    print('Add Task data save============>>>>>>.....');
    return task_list;
  }

  Future<Task> readTask(int id) async {
    final db = await database;

    final maps = await db.query(
      tableAddTask,
      columns: add_task.values,
      where: '${add_task.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Task.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Task>> readAlltask() async {
    final db = await database;
    final orderBy = '${add_task.id} DESC';
    final result = await db.query(tableAddTask, orderBy: orderBy);
    return result.map((json) => Task.fromJson(json)).toList();
  }

  Future<int> update(Task task) async {
    final db = await database;

    return db.update(
      tableAddTask,
      task.toJson(),
      where: '${add_task.id} = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await database;

    return await db.delete(
      tableAddTask,
      where: '${add_task.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await database;

    db.close();
  }
}
