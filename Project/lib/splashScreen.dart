import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_todolist/home.dart';
import 'package:flutter_todolist/loginScreen.dart';
import 'package:flutter_todolist/raw_sql/sql_db.dart';
import 'package:flutter_todolist/tasks.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'appBars.dart';
import 'empty.dart';

String finalEmail;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DbHelper db = new DbHelper();
  @override
  void initState() {
    super.initState();
    db.createTable("category");
    db.createTable("task");
    getValidationData().whenComplete(() async {
      if (finalEmail == null) {
        Timer(
            Duration(seconds: 3),
            () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen())));
      } else {
        Timer(
            Duration(seconds: 3),
            () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Tasks())));
        print(finalEmail);
      }
    });
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('name');
    setState(() {
      finalEmail = obtainedEmail;
    });
    print(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Hero(
        tag: 'Clipboard',
        child: Image.asset('assets/images/Clipboard.png'),
      ),
    );
  }
}
