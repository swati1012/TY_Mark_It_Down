import 'package:flutter/material.dart';
import 'package:flutter_todolist/appBars.dart';
import 'package:flutter_todolist/bottomNavigation.dart';
import 'package:flutter_todolist/database/category_table.dart';
import 'package:flutter_todolist/fab.dart';
import 'package:flutter_todolist/home.dart';
import 'package:flutter_todolist/raw_sql/sql_db.dart';
import 'package:flutter_todolist/util.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_todolist/database/add_task_table.dart';
import 'database/category_db.dart';
import 'database/category_table.dart';
import 'package:flutter_todolist/database/add_task.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_todolist/notificationservice.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class Tasks extends StatefulWidget {
  Tasks({Key key}) : super(key: key);
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Tasks> {
  final bottomNavigationBarIndex = 1;
  bool isLoading = false;
  List<Task> task;
  var obtainedEmail;
  var data;
  getValue() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    setState(() {
      obtainedEmail = sharedPreferences.getString('name');
    });
  }

  DbHelper db = new DbHelper();
  List cat = [];

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    getValue();
    setState(() {
      db.getCategory().then((list) {
        print("getcat $list");
        if (list != null) {
          for (int c = 0; c < list.length; c++) {
            cat.add(list[c]["cat_name"]);
          }
        }
      });
    });
  }

  @override
  void dispose() {
    TaskAddHelper.instance.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fullAppbar(context, obtainedEmail),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              "Categories",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: CustomColors.TextSubHeader),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            SizedBox(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: cat != null ? cat.length : 0,
                  itemBuilder: (context, i) {
                    return Card(
                      elevation: 3,
                      child: ListTile(
                        title: Text(cat[i]),
                        trailing: IconButton(
                            onPressed: () {
                              print(cat[i]);
                              db.updateTableCategory(cat[i]);
                              print("category updated");
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Tasks(),
                                ),
                              );
                            },
                            icon: Image.asset("assets/images/trash.png")),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Home(
                                cat_name: cat[i],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: customFab(context),
      bottomNavigationBar:
          BottomNavigationBarApp(context, bottomNavigationBarIndex),
    );
  }
}
