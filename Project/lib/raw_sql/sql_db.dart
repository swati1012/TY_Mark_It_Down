import 'package:sqflite/sqflite.dart';

// ____________ SQFlite ___________________

class DbHelper {
  Database database;

  createTable(tableName) async {
    if (tableName == 'category') {
      var db = await openDatabase('my_db.db');
      await db.execute(
          "CREATE TABLE IF NOT EXISTS catTable (id INTEGER PRIMARY KEY, cat_name TEXT,status TEXT)");
    } else {
      var db = await openDatabase('my_db.db');
      await db.execute(
          "CREATE TABLE IF NOT EXISTS taskTable (id INTEGER PRIMARY KEY, cat_name TEXT, task TEXT, status TEXT, ischecked TEXT, ispressed TEXT, added_on TEXT )");
    }
  }

  insertCategory(catName) async {
    var db = await openDatabase('my_db.db');

    int id1 = await db.rawInsert(
        'INSERT INTO catTable( cat_name,status) VALUES("$catName","A")');
    print('lastId: $id1');
    return id1;
  }

  insertTask(catName, task, added_on) async {
    var db = await openDatabase('my_db.db');

    int id1 = await db.rawInsert(
        'INSERT INTO taskTable( cat_name,task,status,ischecked,ispressed,added_on) VALUES("$catName","$task","A","false","false","$added_on") ');
    print('lastId: $id1');
    return id1;
  }

  Future getCategory() async {
    // Get the records
    var database = await openDatabase('my_db.db');

    List<Map> list = await database
        .rawQuery('SELECT * FROM catTable where status = "A" ORDER BY id DESC');
    return list;
  }

  updateTableTask(taskName) async {
    // / Update some Table Task
    var database = await openDatabase('my_db.db');
    int count = await database.rawUpdate(
        'UPDATE taskTable SET status = ?  WHERE task = ?', ['D', '$taskName']);
    print('updated: $count');
  }

  updateCheckedTrue(taskName) async {
    // / Update some ischecked Column
    var database = await openDatabase('my_db.db');
    int count = await database.rawUpdate(
        'UPDATE taskTable SET ischecked = ?  WHERE task = ?',
        ['true', '$taskName']);
    print('updated: $count');
  }

  updateCheckedFalse(taskName) async {
    // / Update some ischecked Column
    var database = await openDatabase('my_db.db');
    int count = await database.rawUpdate(
        'UPDATE taskTable SET ischecked = ?  WHERE task = ?',
        ['false', '$taskName']);
    print('updated: $count');
  }

  updatePressedTrue(taskName) async {
    // / Update some ispressed Column
    var database = await openDatabase('my_db.db');
    int count = await database.rawUpdate(
        'UPDATE taskTable SET ispressed = ?  WHERE task = ?',
        ['true', '$taskName']);
    print('updated: $count');
  }

  updatePressedFalse(taskName) async {
    // / Update some ispressed Column
    var database = await openDatabase('my_db.db');
    int count = await database.rawUpdate(
        'UPDATE taskTable SET ispressed = ?  WHERE task = ?',
        ['false', '$taskName']);
    print('updated: $count');
  }

  updateTableCategory(catName) async {
    // / Update status in category Table
    var database = await openDatabase('my_db.db');
    int count = await database.rawUpdate(
        'UPDATE catTable SET status = ?  WHERE cat_name = ?',
        ['D', '$catName']);
    print('updated: $count');
  }

  Future getTask(catName) async {
    // Get the records
    var database = await openDatabase('my_db.db');
    List<Map> list = await database.rawQuery(
        'SELECT * FROM taskTable where cat_name = "$catName" AND status= "A" ORDER BY id DESC');
    return list;
  }

  closeDb() async {
    // Close the database
    await database.close();
  }
}
