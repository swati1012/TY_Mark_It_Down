import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todolist/blog.dart';
import 'package:flutter_todolist/home.dart';
import 'package:flutter_todolist/target.dart';
import 'package:flutter_todolist/tasks.dart';
import 'util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationBarApp extends StatelessWidget {
  final int bottomNavigationBarIndex;
  final BuildContext context;
  const BottomNavigationBarApp(this.context, this.bottomNavigationBarIndex);
  void onTabTapped(index) {
    print(index);
    if (index == 0) {
      Navigator.push(context, CupertinoPageRoute(builder: (context) => Home()));
    } else if (index == 1) {
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => Tasks()));
    } else if (index == 3) {
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => Blogs()));
    } else {
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => Target()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: bottomNavigationBarIndex,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 10,
      selectedLabelStyle: TextStyle(color: CustomColors.BlueDark),
      selectedItemColor: CustomColors.BlueDark,
      unselectedFontSize: 10,
      items: [
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Image.asset(
              'assets/images/home.png',
              color: (bottomNavigationBarIndex == 0)
                  ? CustomColors.BlueDark
                  : CustomColors.TextGrey,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Image.asset(
              'assets/images/task.png',
              color: (bottomNavigationBarIndex == 1)
                  ? CustomColors.BlueDark
                  : CustomColors.TextGrey,
            ),
          ),
          label: 'Category',
        ),
        BottomNavigationBarItem(
          icon: Container(
              // margin: EdgeInsets.only(bottom:5),
              // child: Image.asset(
              //   'assets/images/home.png',
              //   color: (bottomNavigationBarIndex == 0)
              //       ? CustomColors.BlueDark
              //       : CustomColors.TextGrey,
              // ),
              ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Image.asset(
              'assets/images/icons8-books-32.png',
              color: (bottomNavigationBarIndex == 3)
                  ? CustomColors.BlueDark
                  : CustomColors.TextGrey,
            ),
          ),
          label: 'Blog',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Image.asset(
              'assets/images/icons8-to-do-32.png',
              color: (bottomNavigationBarIndex == 4)
                  ? CustomColors.BlueDark
                  : CustomColors.TextGrey,
            ),
          ),
          label: 'Goals',
        ),
      ],
      onTap: onTabTapped,
    );
  }
}
