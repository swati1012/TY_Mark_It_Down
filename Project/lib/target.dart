import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_todolist/appBars.dart';
import 'package:flutter_todolist/bottomNavigation.dart';
import 'package:flutter_todolist/fab.dart';
import 'package:flutter_todolist/util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class Target extends StatefulWidget {
  Target({Key key}) : super(key: key);
  _TargetState createState() => _TargetState();
}

class _TargetState extends State<Target> {
  final bottomNavigationBarIndex = 4;
  bool selected = true;
  Color _iconColor1 = Colors.grey;
  Color _iconColor2 = Colors.grey;
  Color _iconColor3 = Colors.grey;
  Color _iconColor4 = Colors.grey;
  Color _iconColor5 = Colors.grey;
  Color _iconColor6 = Colors.grey;
  Color _iconColor7 = Colors.grey;
  Color _iconColor8 = Colors.grey;
  Color _iconColor9 = Colors.grey;
  Color _iconColor10 = Colors.grey;
  Color _iconColor11 = Colors.grey;

  var isChecked = false;
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fullAppbar(context, obtainedEmail),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 20, bottom: 15),
              child: Text(
                'Today',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: CustomColors.TextSubHeader),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RoundCheckBox(
                    onTap: (selected) {},
                    size: 25,
                    checkedColor: Colors.green.shade300,
                  ),
                  Container(
                    width: 220,
                    child: Text(
                      'Wake up Early',
                      style: TextStyle(
                          color: CustomColors.TextHeader,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.star),
                    color: _iconColor1,
                    onPressed: () {
                      setState(() {
                        if (_iconColor1 == Colors.grey) {
                          _iconColor1 = Colors.yellow;
                        } else {
                          _iconColor1 = Colors.grey;
                        }
                      });
                    },
                  ),
                ],
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [CustomColors.YellowIcon, Colors.white],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreyBorder,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RoundCheckBox(
                    onTap: (selected) {},
                    size: 25,
                    checkedColor: Colors.green.shade300,
                  ),
                  Container(
                    width: 220,
                    child: Text(
                      'Breathing Exercises',
                      style: TextStyle(
                          color: CustomColors.TextHeader,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.star),
                    color: _iconColor2,
                    onPressed: () {
                      setState(() {
                        if (_iconColor2 == Colors.grey) {
                          _iconColor2 = Colors.yellow;
                        } else {
                          _iconColor2 = Colors.grey;
                        }
                      });
                    },
                  ),
                ],
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [CustomColors.GreenIcon, Colors.white],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreyBorder,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RoundCheckBox(
                    onTap: (selected) {},
                    size: 25,
                    checkedColor: Colors.green.shade300,
                  ),
                  Container(
                    width: 220,
                    child: Text(
                      'Stretching',
                      style: TextStyle(
                          color: CustomColors.TextHeader,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.star),
                    color: _iconColor3,
                    onPressed: () {
                      setState(() {
                        if (_iconColor3 == Colors.grey) {
                          _iconColor3 = Colors.yellow;
                        } else {
                          _iconColor3 = Colors.grey;
                        }
                      });
                    },
                  ),
                ],
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [CustomColors.PurpleIcon, Colors.white],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreyBorder,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RoundCheckBox(
                    onTap: (selected) {},
                    size: 25,
                    checkedColor: Colors.green.shade300,
                  ),
                  Container(
                    width: 220,
                    child: Text(
                      'Setting Step Goals',
                      style: TextStyle(
                          color: CustomColors.TextHeader,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.star),
                    color: _iconColor4,
                    onPressed: () {
                      setState(() {
                        if (_iconColor4 == Colors.grey) {
                          _iconColor4 = Colors.yellow;
                        } else {
                          _iconColor4 = Colors.grey;
                        }
                      });
                    },
                  ),
                ],
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [CustomColors.BlueIcon, Colors.white],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreyBorder,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RoundCheckBox(
                    onTap: (selected) {},
                    size: 25,
                    checkedColor: Colors.green.shade300,
                  ),
                  Container(
                    width: 220,
                    child: Text(
                      'Eat Breakfast',
                      style: TextStyle(
                          color: CustomColors.TextHeader,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.star),
                    color: _iconColor5,
                    onPressed: () {
                      setState(() {
                        if (_iconColor5 == Colors.grey) {
                          _iconColor5 = Colors.yellow;
                        } else {
                          _iconColor5 = Colors.grey;
                        }
                      });
                    },
                  ),
                ],
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [CustomColors.OrangeIcon, Colors.white],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreyBorder,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RoundCheckBox(
                    onTap: (selected) {},
                    size: 25,
                    checkedColor: Colors.green.shade300,
                  ),
                  Container(
                    width: 220,
                    child: Text(
                      'Drink More Water',
                      style: TextStyle(
                          color: CustomColors.TextHeader,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.star),
                    color: _iconColor6,
                    onPressed: () {
                      setState(() {
                        if (_iconColor6 == Colors.grey) {
                          _iconColor6 = Colors.yellow;
                        } else {
                          _iconColor6 = Colors.grey;
                        }
                      });
                    },
                  ),
                ],
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [CustomColors.YellowIcon, Colors.white],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreyBorder,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RoundCheckBox(
                    onTap: (selected) {},
                    size: 25,
                    checkedColor: Colors.green.shade300,
                  ),
                  Container(
                    width: 220,
                    child: Text(
                      'Organizing Home and Work Space',
                      style: TextStyle(
                          color: CustomColors.TextHeader,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.star),
                    color: _iconColor7,
                    onPressed: () {
                      setState(() {
                        if (_iconColor7 == Colors.grey) {
                          _iconColor7 = Colors.yellow;
                        } else {
                          _iconColor7 = Colors.grey;
                        }
                      });
                    },
                  ),
                ],
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [CustomColors.GreenIcon, Colors.white],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreyBorder,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RoundCheckBox(
                    onTap: (selected) {},
                    size: 25,
                    checkedColor: Colors.green.shade300,
                  ),
                  Container(
                    width: 220,
                    child: Text(
                      'Journaling',
                      style: TextStyle(
                          color: CustomColors.TextHeader,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.star),
                    color: _iconColor8,
                    onPressed: () {
                      setState(() {
                        if (_iconColor8 == Colors.grey) {
                          _iconColor8 = Colors.yellow;
                        } else {
                          _iconColor8 = Colors.grey;
                        }
                      });
                    },
                  ),
                ],
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [CustomColors.PurpleIcon, Colors.white],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreyBorder,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RoundCheckBox(
                    onTap: (selected) {},
                    size: 25,
                    checkedColor: Colors.green.shade300,
                  ),
                  Container(
                    width: 220,
                    child: Text(
                      'Walk for Thirty Minutes a Day',
                      style: TextStyle(
                          color: CustomColors.TextHeader,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.star),
                    color: _iconColor9,
                    onPressed: () {
                      setState(() {
                        if (_iconColor9 == Colors.grey) {
                          _iconColor9 = Colors.yellow;
                        } else {
                          _iconColor9 = Colors.grey;
                        }
                      });
                    },
                  ),
                ],
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [CustomColors.BlueIcon, Colors.white],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreyBorder,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RoundCheckBox(
                    onTap: (selected) {},
                    size: 25,
                    checkedColor: Colors.green.shade300,
                  ),
                  Container(
                    width: 220,
                    child: Text(
                      'Inhale Fresh Air Fifteen Minutes',
                      style: TextStyle(
                          color: CustomColors.TextHeader,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.star),
                    color: _iconColor10,
                    onPressed: () {
                      setState(() {
                        if (_iconColor10 == Colors.grey) {
                          _iconColor10 = Colors.yellow;
                        } else {
                          _iconColor10 = Colors.grey;
                        }
                      });
                    },
                  ),
                ],
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [CustomColors.OrangeIcon, Colors.white],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreyBorder,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RoundCheckBox(
                    onTap: (selected) {},
                    size: 25,
                    checkedColor: Colors.green.shade300,
                  ),
                  Container(
                    width: 220,
                    child: Text(
                      'Take Naps',
                      style: TextStyle(
                          color: CustomColors.TextHeader,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.star),
                    color: _iconColor11,
                    onPressed: () {
                      setState(() {
                        if (_iconColor11 == Colors.grey) {
                          _iconColor11 = Colors.yellow;
                        } else {
                          _iconColor11 = Colors.grey;
                        }
                      });
                    },
                  ),
                ],
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [CustomColors.YellowIcon, Colors.white],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreyBorder,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15)
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
