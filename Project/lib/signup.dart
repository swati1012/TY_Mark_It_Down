import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todolist/loginScreen.dart';
import 'package:flutter_todolist/login_table.dart';
import 'package:flutter_todolist/notes_db.dart';
import 'package:flutter_todolist/util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isRememberMe = false;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  String message = '';
  final form_key = GlobalKey<FormState>();

  Widget buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Name',
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
          child: TextFormField(
            controller: name,
            validator: (value) {
              value = value.toString().trim();
              if (value.isEmpty ||
                  RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)) {
                return '    Please Enter valid Name\n';
              }
            },
            keyboardType: TextInputType.name,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.people,
                  color: Color(0xff0077b6),
                ),
                hintText: 'Name',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
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
          child: TextFormField(
            controller: email,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              value = value.toString().trim();
              if (value.isEmpty) {
                return '    Please Enter the email\n';
              }
              if (email.text.toString().length < 8 ||
                  !email.text.toString().contains('@') ||
                  !email.text.toString().contains('com')) {
                return '    Invalid email\n';
              }
            },
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff0077b6),
                ),
                hintText: 'Email',
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
          child: TextFormField(
            controller: password,
            obscureText: true,
            validator: (value) {
              value = value.toString().trim();
              if (value.isEmpty) {
                return '    Please Enter the Password\n';
              }
              if (password.text.toString().length < 8) {
                return '    Length of the password should be greater than 8\n';
              }
            },
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

  Widget buildConfirmPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Confirm Password',
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
          child: TextFormField(
            controller: confirm_password,
            obscureText: true,
            validator: (value) {
              value = value.toString().trim();
              if (value.isEmpty) {
                return '    Please Enter the password again\n';
              }
            },
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock_clock_outlined,
                  color: Color(0xff0077b6),
                ),
                hintText: 'Confirm Password',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        ),
      ],
    );
  }

  void snack(BuildContext context) {
    final snackBar2 = SnackBar(
      content: Text(
        'Password Doesn\'t match..',
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.black.withOpacity(0.6),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar2);
  }

  Widget buildSignUpBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          print(name.text);
          print(email.text);
          print(password.text);
          var row = {
            "name": name.text,
            "password": password.text,
            "email": email,
          };
          Logindbhelper().save(Login(
              name: name.text, email: email.text, password: password.text));

          Logindbhelper().readAlllogin().then((value) {
            print(value.toString());
            for (int i = 0; i < value.length; i++) {
              print(value[i].name);
              print(value[i].email);
              print(value[i].password);
            }
          });
          if (form_key.currentState.validate() &&
              password.text == confirm_password.text) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          } else {
            snack(context);
          }
        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        child: Text(
          'Sign Up',
          style: TextStyle(
            color: Color(0xFF0077b6),
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget buildLoginBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'Do you already have an account? ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          TextSpan(
              text: 'Login',
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
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 90),
                child: Form(
                  key: form_key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 50),
                      buildName(),
                      SizedBox(height: 20),
                      buildEmail(),
                      SizedBox(height: 20),
                      buildPassword(),
                      SizedBox(height: 20),
                      buildConfirmPassword(),
                      SizedBox(height: 40),
                      buildSignUpBtn(),
                      buildLoginBtn(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
