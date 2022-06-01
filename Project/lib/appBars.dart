import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_todolist/loginScreen.dart';
import 'package:flutter_todolist/onboarding.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'util.dart';

getValue() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  return sharedPreferences.getString('name').toString();
}

Widget fullAppbar(BuildContext context, String name) {
  return PreferredSize(
    preferredSize: Size.fromHeight(90.0),
    child: NewGradientAppBar(
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomPaint(
            painter: CircleOne(),
          ),
          CustomPaint(
            painter: CircleTwo(),
          ),
        ],
      ),
      title: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hi $name !',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text('Do you want to logout?'),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () async {
                            final SharedPreferences preferences =
                                await SharedPreferences.getInstance();
                            preferences.remove("name");
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text('Yes')),
                      FlatButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('No')),
                    ],
                    elevation: 25.0,
                  );
                });
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
            child: Image.asset('assets/images/profile_img.png'),
          ),
        ),
      ],
      elevation: 0,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [CustomColors.HeaderBlueDark, CustomColors.HeaderBlueLight],
      ),
    ),
  );
}

Widget emptyAppbar(String name) {
  return PreferredSize(
    preferredSize: Size.fromHeight(75.0),
    child: NewGradientAppBar(
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomPaint(
            painter: CircleOne(),
          ),
          CustomPaint(
            painter: CircleTwo(),
          ),
        ],
      ),
      title: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hi $name !',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              'Today you have no tasks',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
          child: Image.asset('assets/images/profile_img.png'),
        ),
      ],
      elevation: 0,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [CustomColors.HeaderBlueDark, CustomColors.HeaderBlueLight],
      ),
    ),
  );
}

class CircleOne extends CustomPainter {
  Paint _paint;

  CircleOne() {
    _paint = Paint()
      ..color = CustomColors.HeaderCircle
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(28.0, 0.0), 99.0, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CircleTwo extends CustomPainter {
  Paint _paint;

  CircleTwo() {
    _paint = Paint()
      ..color = CustomColors.HeaderCircle
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(-30, 20), 50.0, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
