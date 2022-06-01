import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_todolist/appBars.dart';
import 'package:flutter_todolist/bottomNavigation.dart';
import 'package:flutter_todolist/database/category_table.dart';
import 'package:flutter_todolist/fab.dart';
import 'package:flutter_todolist/home.dart';
import 'package:flutter_todolist/raw_sql/sql_db.dart';
import 'package:flutter_todolist/util.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'database/category_db.dart';
import 'database/category_table.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_todolist/notificationservice.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class Blog5s extends StatefulWidget {
  Blog5s({Key key}) : super(key: key);
  _Blog5state createState() => _Blog5state();
}

class _Blog5state extends State<Blog5s> {
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
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "Sleep seven to eight hours a night",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: CustomColors.TextHeaderGrey),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child:
                      Image.asset('assets/images/blog4.jpg', fit: BoxFit.fill),
                ),
                Card(
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                      minVerticalPadding: 15,
                      title: Text(
                        'Getting more sleep seems to be a healthy habit many people need to improve on. We already know that we need at least seven hours of shut-eye each night, so what prevents us from getting it? Think about how you can improve your biggest sleep disruptors',
                      )),
                ),
              ],
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
