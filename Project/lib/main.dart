import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todolist/loginScreen.dart';
import 'package:flutter_todolist/onboarding.dart';
import 'package:flutter_todolist/splashScreen.dart';
import 'util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key);
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, //top bar color
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: CustomColors.GreyBackground,
        fontFamily: 'rubik',
      ),
      home: MyApp(),
    );
  }
}
