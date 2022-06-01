import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_todolist/database/add_task_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'category_table.dart';

class CategoryAddHelper {
  static Database _database;

  static var instance;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB('category.db');
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
        'CREATE TABLE $tableAddCategory(${category_field.cat_id} INTEGER PRIMARY KEY, ${category_field.description} TEXT, ${category_field.category} TEXT)');
  }

  Future<dynamic> save(Category category_list) async {
    var dbClient = await database;
    category_list.cat_id =
        await dbClient.insert(tableAddCategory, category_list.toJson());
    print('Add Category data save============>>>>>>.....');
    return category_list;
  }

  Future<Category> readTask(int cat_id) async {
    final db = await database;

    final maps = await db.query(
      tableAddCategory,
      columns: category_field.values,
      where: '${category_field.cat_id} = ?',
      whereArgs: [cat_id],
      orderBy: '${category_field.cat_id} DESC',
    );

    if (maps.isNotEmpty) {
      return Category.fromJson(maps.first);
    } else {
      throw Exception('ID $cat_id not found');
    }
  }

  Future<List<Category>> readAllCategory() async {
    final db = await database;
    final orderBy = '${category_field.cat_id} DESC';
    final result = await db.query(tableAddCategory, orderBy: orderBy);
    return result.map((json) => Category.fromJson(json)).toList();
  }

  Future<int> update(Category category) async {
    final db = await database;

    return db.update(
      tableAddCategory,
      category.toJson(),
      where: '${category_field.cat_id} = ?',
      whereArgs: [category.cat_id],
    );
  }

  Future<int> delete(int cat_id) async {
    final db = await database;

    return await db.delete(
      tableAddCategory,
      where: '${category_field.cat_id} = ?',
      whereArgs: [cat_id],
    );
  }

  Future close() async {
    final db = await database;

    db.close();
  }
}
