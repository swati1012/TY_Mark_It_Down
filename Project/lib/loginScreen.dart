import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todolist/notes_db.dart';
import 'package:flutter_todolist/signup.dart';
import 'package:flutter_todolist/home.dart';
import 'package:flutter_todolist/util.dart';
import 'package:flutter_todolist/onboarding.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememberMe = false;
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Username',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 3, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: name,
            keyboardType: TextInputType.name,
            autofillHints: [AutofillHints.name],
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.people,
                  color: Color(0xff0077b6),
                ),
                hintText: 'Enter Name',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        ),
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 3, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: password,
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff0077b6),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        ),
      ],
    );
  }

  Widget buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () async {
          final SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setString('name', name.text);
          print('=============================================');
          print(name.text);
          print(password.text);
          var row = {
            "name": name.text,
            "password": password.text,
          };
          Logindbhelper().readAlllogin().then((value) {
            bool ismatched = false;
            for (int i = 0; i < value.length; i++) {
              print('=============================================');
              print(value[i].name);
              print(value[i].name.runtimeType);
              print(value[i].password);
              print(value[i].password.runtimeType);
              if (name.text == value[i].name &&
                  password.text == value[i].password) {
                print("matched");
                setState(() {
                  ismatched = true;
                });
                if (ismatched == true) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Onboarding(),
                    ),
                  );
                  break;
                }
              } else {
                print("not matched");
                setState(() {
                  ismatched = false;
                });
              }
            }
            if (ismatched == false) {
              snack(context);
            }
          });
        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        child: Text(
          'Login',
          style: TextStyle(
            color: Color(0xFF0077b6),
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  void snack(BuildContext context) {
    final snackBar2 = SnackBar(
      content: Text(
        'Invalid credentials. Please try again..',
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.black.withOpacity(0.6),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar2);
  }

  Widget buildSignUpBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SignUp(),
          ),
        );
      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'Don\'t have an account? ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold))
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    CustomColors.HeaderBlueDark,
                    CustomColors.HeaderBlueLight
                  ],
                ),
              ),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 50),
                    buildEmail(),
                    SizedBox(height: 30),
                    buildPassword(),
                    SizedBox(height: 40),
                    buildLoginBtn(),
                    buildSignUpBtn(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
