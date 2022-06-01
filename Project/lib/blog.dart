import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_todolist/blog2.dart';
import 'package:flutter_todolist/appBars.dart';
import 'package:flutter_todolist/blog5.dart';
import 'package:flutter_todolist/blog6.dart';
import 'package:flutter_todolist/blog7.dart';
import 'package:flutter_todolist/blog8.dart';
import 'package:flutter_todolist/blog9.dart';
import 'package:flutter_todolist/blog1.dart';
import 'package:flutter_todolist/bottomNavigation.dart';
import 'package:flutter_todolist/database/category_table.dart';
import 'package:flutter_todolist/fab.dart';
import 'package:flutter_todolist/blog3.dart';
import 'package:flutter_todolist/home.dart';
import 'package:flutter_todolist/raw_sql/sql_db.dart';
import 'package:flutter_todolist/blog4.dart';
import 'package:flutter_todolist/util.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'database/category_db.dart';
import 'database/category_table.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_todolist/notificationservice.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class Blogs extends StatefulWidget {
  Blogs({Key key}) : super(key: key);
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blogs> {
  final bottomNavigationBarIndex = 3;
  bool isLoading = false;
  var obtainedEmail;
  var data;
  getValue() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    setState(() {
      obtainedEmail = sharedPreferences.getString('name');
    });
  }

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    getValue();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fullAppbar(context, obtainedEmail),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            SizedBox(height: 10),
            Text(
              "Blogs",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: CustomColors.TextSubHeader),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            Container(
              child: Column(
                children: <Widget>[
                  Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text(
                        'Plan and prioritize',
                        style: TextStyle(fontSize: 17),
                      ),
                      trailing: Icon(Icons.double_arrow),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Blog1s(),
                          ),
                        );
                      },
                    ),
                  ),
                  Card(
                      elevation: 3,
                      child: ListTile(
                        title: Text(
                          'Life Hack',
                          style: TextStyle(fontSize: 17),
                        ),
                        trailing: Icon(Icons.double_arrow),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Blog2s(),
                            ),
                          );
                        },
                      )),
                  Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text(
                        'Mental Fitness',
                        style: TextStyle(fontSize: 17),
                      ),
                      trailing: Icon(Icons.double_arrow),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Blog3s(),
                          ),
                        );
                      },
                    ),
                  ),
                  Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text(
                        'Do something meaningful each day',
                        style: TextStyle(fontSize: 17),
                      ),
                      trailing: Icon(Icons.double_arrow),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Blog4s(),
                          ),
                        );
                      },
                    ),
                  ),
                  Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text(
                        'Sleep seven to eight hours a night',
                        style: TextStyle(fontSize: 17),
                      ),
                      trailing: Icon(Icons.double_arrow),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Blog5s(),
                          ),
                        );
                      },
                    ),
                  ),
                  Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text(
                        'Eat nourishing food',
                        style: TextStyle(fontSize: 17),
                      ),
                      trailing: Icon(Icons.double_arrow),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Blog6s(),
                          ),
                        );
                      },
                    ),
                  ),
                  Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text(
                        'Keep company with good people',
                        style: TextStyle(fontSize: 17),
                      ),
                      trailing: Icon(Icons.double_arrow),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Blog7s(),
                          ),
                        );
                      },
                    ),
                  ),
                  Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text(
                        'Think good thoughts for others',
                        style: TextStyle(fontSize: 17),
                      ),
                      trailing: Icon(Icons.double_arrow),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Blog8s(),
                          ),
                        );
                      },
                    ),
                  ),
                  Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text(
                        'Make incremental changes',
                        style: TextStyle(fontSize: 17),
                      ),
                      trailing: Icon(Icons.double_arrow),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Blog9s(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20)
                ],
              ),
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
