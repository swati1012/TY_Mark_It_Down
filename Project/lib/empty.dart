import 'package:flutter/material.dart';
import 'package:flutter_todolist/appBars.dart';
import 'package:flutter_todolist/bottomNavigation.dart';
import 'package:flutter_todolist/fab.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'util.dart';

class Empty extends StatefulWidget {
  @override
  _EmptyState createState() => _EmptyState();
}

class _EmptyState extends State<Empty> {
  var bottomNavigationBarIndex = 0;
  var obtainedEmail;
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
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: emptyAppbar(obtainedEmail),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.2,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 8,
                child: Hero(
                  tag: 'Clipboard',
                  child: Image.asset('assets/images/Clipboard-empty.png'),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    Text(
                      'No tasks',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: CustomColors.TextHeader),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'You have no tasks to do.',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: CustomColors.TextBody,
                          fontFamily: 'opensans'),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: customFab(context),
      bottomNavigationBar:
          BottomNavigationBarApp(context, bottomNavigationBarIndex),
    );
  }
}
