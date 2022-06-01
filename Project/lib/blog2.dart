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

class Blog2s extends StatefulWidget {
  Blog2s({Key key}) : super(key: key);
  _Blog2state createState() => _Blog2state();
}

class _Blog2state extends State<Blog2s> {
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
              "Life Hacks",
              style: TextStyle(
                  fontSize: 25,
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
                  child: Image.asset('assets/images/life_hack.jpg',
                      fit: BoxFit.fill),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Card(
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    minVerticalPadding: 15,
                    title: Text(
                        'One of the most important things that you can do for your brain and your overall well-being is to start every morning with exercise.You don’t have to go to the gym and spend 3 hours pumping iron like Arnold in his prime either.Simply getting the blood flowing for 20 minutes will sufficiently spark your mind and help you develop stronger focus throughout the day.Some great activities to try are; swimming, racquetball, yoga, or cycling.'),
                  ),
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
