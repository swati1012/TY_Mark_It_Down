import 'package:flutter/material.dart';
import 'package:flutter_todolist/database/add_task.dart';
import 'package:flutter_todolist/database/add_task_table.dart';
import 'package:flutter_todolist/home.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todolist/raw_sql/sql_db.dart';
import 'package:flutter_todolist/tasks.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_todolist/database/category_db.dart';
import 'package:flutter_todolist/database/category_table.dart';
import 'onboarding.dart';
import 'util.dart';

class Modal {
  TextEditingController category = TextEditingController(text: 'Office');
  List<String> subTasks = <String>['School', 'College'];

  getValue() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('name');
    print(obtainedEmail);
  }

  DbHelper db = new DbHelper();

  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height - 200,
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              Positioned(
                top: MediaQuery.of(context).size.height / 25,
                left: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.elliptical(175, 30),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2 - 370,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          child: Image.asset('assets/images/fab-delete.png'),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                CustomColors.PurpleLight,
                                CustomColors.PurpleDark,
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: CustomColors.PurpleShadow,
                                blurRadius: 10.0,
                                spreadRadius: 5.0,
                                offset: Offset(0.0, 0.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(height: 10),
                          Text(
                            'Add new category',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: TextFormField(
                              controller: category,
                              autofocus: true,
                              style: TextStyle(
                                  fontSize: 22, fontStyle: FontStyle.normal),
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 60,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  width: 1.0,
                                  color: CustomColors.GreyBorder,
                                ),
                              ),
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {
                              db.createTable(category);
                              db.insertCategory(category.text);

                              Navigator.pop(context);
                              Navigator.of(context).push(
                                MaterialPageRoute<Null>(
                                    builder: (BuildContext context) {
                                  return Tasks();
                                }),
                              );
                            },
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(0.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 60,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    CustomColors.BlueLight,
                                    CustomColors.BlueDark,
                                  ],
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: CustomColors.BlueShadow,
                                    blurRadius: 2.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(0.0, 0.0),
                                  ),
                                ],
                              ),
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Center(
                                child: const Text(
                                  'Add category',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
