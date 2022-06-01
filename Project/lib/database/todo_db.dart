import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_todolist/database/add_task_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'category_table.dart';
import 'package:flutter_todolist/database/todo_table.dart';

class TodoAddHelper {
  static Database _database;

  static var instance;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB('todo.db');
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
        'CREATE TABLE $tableAddTodo(${todo_field.todo_id} INTEGER PRIMARY KEY, ${todo_field.todo} TEXT, ${todo_field.cat_name} TEXT)');
  }

  Future<dynamic> save(Todo todo_list) async {
    var dbClient = await database;
    todo_list.todo_id = await dbClient.insert(tableAddTodo, todo_list.toJson());
    print('Add Todo data save============>>>>>>.....');
    return todo_list;
  }

  Future<Todo> readTodo(int todo_id) async {
    final db = await database;

    final maps = await db.query(
      tableAddTodo,
      columns: todo_field.values,
      where: '${todo_field.todo_id} = ?',
      whereArgs: [todo_id],
      orderBy: '${todo_field.todo_id} DESC',
    );

    if (maps.isNotEmpty) {
      return Todo.fromJson(maps.first);
    } else {
      throw Exception('ID $todo_id not found');
    }
  }

  Future<List<Todo>> readAllTodo() async {
    final db = await database;
    final orderBy = '${todo_field.todo_id} DESC';
    final result = await db.query(tableAddTodo, orderBy: orderBy);
    return result.map((json) => Todo.fromJson(json)).toList();
  }

  Future<int> update(Todo todo) async {
    final db = await database;

    return db.update(
      tableAddTodo,
      todo.toJson(),
      where: '${todo_field.todo_id} = ?',
      whereArgs: [todo.todo_id],
    );
  }

  Future<int> delete(int todo_id) async {
    final db = await database;

    return await db.delete(
      tableAddTodo,
      where: '${todo_field.todo_id} = ?',
      whereArgs: [todo_id],
    );
  }

  Future close() async {
    final db = await database;

    db.close();
  }
}
