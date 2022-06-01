import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_todolist/appBars.dart';
import 'package:flutter_todolist/bottomNavigation.dart';
import 'package:flutter_todolist/database/add_task.dart';
import 'package:flutter_todolist/database/add_task_table.dart';
import 'package:flutter_todolist/fab.dart';
import 'package:flutter_todolist/raw_sql/sql_db.dart';
import 'package:flutter_todolist/util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'database/todo_db.dart';
import 'database/todo_table.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_todolist/notificationservice.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class Home extends StatefulWidget {
  final cat_name;
  Home({Key key, this.cat_name}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController todo = TextEditingController();
  String tdata = DateFormat("hh:mm:ss").format(DateTime.now());
  final bottomNavigationBarIndex = 0;
  var obtainedEmail;
  bool _checked = false;
  bool value = false;
  List<Todo> todo_list;
  List<Todo> cat_list;
  bool isPressed = false;
  Icon notification = Icon(
    Icons.notifications,
  );
  Icon notnotification = Icon(
    Icons.notifications_active,
  );
  bool addNotification = false;
  var data;
  getValue() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    setState(() {
      obtainedEmail = sharedPreferences.getString('name');
    });
  }

  List ischecked = [];
  List ispressed = [];

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    getValue();
    setState(() {
      db.getTask(widget.cat_name).then((list) {
        print("getTask $list");
        if (list != null) {
          for (int c = 0; c < list.length; c++) {
            task.add(list[c]["task"]);
            catName.add(list[c]["cat_name"]);
            added_on.add(list[c]["added_on"]);
            ischecked.add(false);
            ispressed.add(false);
          }
        }
      });
    });
  }

  DbHelper db = new DbHelper();
  List task = [], catName = [], added_on = [];

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
            Container(
              margin: EdgeInsets.only(top: 15, left: 20, bottom: 5),
              child: Text(
                'Add Task in ${widget.cat_name}',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: CustomColors.TextSubHeader),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextFormField(
                    controller: todo,
                    autofocus: true,
                    style: TextStyle(fontSize: 17, fontStyle: FontStyle.normal),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(height: 3),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 40,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: CustomColors.GreyBorder,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1),
                RaisedButton(
                  onPressed: () async {
                    db.insertTask(
                        widget.cat_name,
                        todo.text,
                        DateFormat("hh:mm")
                            .format(DateTime.now())); //only time req
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Home(
                          cat_name: widget.cat_name,
                        ),
                      ),
                    );
                  },
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: 45,
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
                    padding: const EdgeInsets.fromLTRB(5, 4, 5, 4),
                    child: Center(
                      child: const Text(
                        'Add Task',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
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
            SizedBox(
              height: 400,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: task != null ? task.length : 0,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  child: CheckboxListTile(
                                      title: ischecked[i] == false
                                          ? Text(task[i],
                                              style: TextStyle(
                                                  color:
                                                      CustomColors.TextHeader,
                                                  fontWeight: FontWeight.w600))
                                          : Text(task[i],
                                              style: TextStyle(
                                                  color:
                                                      CustomColors.TextHeader,
                                                  fontWeight: FontWeight.w600,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  decorationColor:
                                                      Colors.red.shade900)),
                                      subtitle: Text(added_on[i].toString()),
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      secondary: IconButton(
                                          icon: Icon(
                                              Icons.notification_add_outlined,
                                              color: ispressed[i] == true
                                                  ? Color(0xff007397)
                                                  : Color(0xff9A9A9A)),
                                          onPressed: () {
                                            setState(() {
                                              if (ispressed[i] == true) {
                                                ispressed[i] = false;
                                                db.updatePressedFalse(task[i]);
                                              } else {
                                                ispressed[i] = true;
                                                db.updatePressedTrue(task[i]);
                                                NotificationService()
                                                    .showNotification(
                                                        1,
                                                        "Mark It Down",
                                                        "Task to be completed",
                                                        10);
                                              }
                                            });
                                          }),
                                      value: ischecked[i],
                                      onChanged: (bool value) {
                                        setState(() {
                                          if (ischecked[i] == true) {
                                            ischecked[i] = false;
                                            db.updateCheckedFalse(task[i]);
                                          } else {
                                            ischecked[i] = true;
                                            db.updateCheckedTrue(task[i]);
                                          }
                                        });
                                      }),
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
                          secondaryActions: <Widget>[
                            SlideAction(
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: CustomColors.TrashRedBackground),
                                    child:
                                        Image.asset('assets/images/trash.png'),
                                  ),
                                ),
                                onTap: () {
                                  db.updateTableTask(task[i]);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => Home(
                                        cat_name: widget.cat_name,
                                      ),
                                    ),
                                  );
                                }),
                          ],
                        ),
                        i == (task.length - 1)
                            ? Container(
                                height: 50,
                              )
                            : Container(),
                      ],
                    );
                  }),
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
