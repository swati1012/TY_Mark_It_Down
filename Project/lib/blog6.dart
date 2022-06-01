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

class Blog6s extends StatefulWidget {
  Blog6s({Key key}) : super(key: key);
  _Blog6state createState() => _Blog6state();
}

class _Blog6state extends State<Blog6s> {
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
              "Eat nourishing food",
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
                      Image.asset('assets/images/blog5.jpg', fit: BoxFit.fill),
                ),
                Card(
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    minVerticalPadding: 15,
                    title: Text(
                        "We all know that wholesome food is the crux for well-being, but it's common to regard healthy eating primarily as a tool for weight loss. However, according to the 2015 Dietary Guidelines for Americans, a balanced diet high in fruits and vegetables, lean protein, low-fat dairy and whole grains is what you need for optimal energy. After all, you really are what you eat to some extent. Consume a variety of foods from all the food groups to get a range of nutrients to energize you throughout the day. "),
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
