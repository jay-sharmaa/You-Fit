import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youfit/mydrawerbasic.dart';
import 'package:youfit/services/services.dart';

class Drawerpage1 extends StatefulWidget {
  const Drawerpage1({super.key});

  @override
  State<Drawerpage1> createState() => _drawerpage1State();
}

class _drawerpage1State extends State<Drawerpage1> {
  final authservices = services();
  bool? gender;
  int? restTime = 25;
  int? workTime = 30;

  @override
  void initState() {
    super.initState();
    getGender();
    readRestTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Youfit"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Change Gender"),
                    content: const Text(
                        "Please select the gender you want to change"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          changeGender();
                          Navigator.pop(context);
                        },
                        child: const Text("Change"),
                      ),
                    ],
                  );
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Gender"),
                trailing: Text(
                  gender! ? "Male" : "Female",
                  style:
                      const TextStyle(fontSize: 15, color: Colors.blueAccent),
                ),
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.coffee),
              title: const Text("Training rest"),
              trailing: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Time Picker"),
                        content:
                            const Text("Pick Time for in between exercise"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              setMinusRestTime();
                              readRestTime();
                            },
                            child: const Text(
                              "-",
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setPlusRestTime();
                              readRestTime();
                            },
                            child: const Text(
                              "+",
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  "$restTime sec",
                  style:
                      const TextStyle(color: Colors.blueAccent, fontSize: 15),
                ),
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.accessibility_new_rounded),
              title: const Text("Training time"),
              trailing: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Time Picker"),
                        content:
                        const Text("Pick Time for in exercise"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              setMinusWorkTime();
                              readWorkTime();
                            },
                            child: const Text(
                              "-",
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setPlusWorkTime();
                              readWorkTime();
                            },
                            child: const Text(
                              "+",
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  "$workTime sec",
                  style:
                  const TextStyle(color: Colors.blueAccent, fontSize: 15),
                ),
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
        ],
      ),
    );
  }

  void getGender() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      gender = prefs.getBool("Gender");
      gender ??= true;
    });
  }

  void setPlusWorkTime() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      if(workTime! >= 120){
        prefs.setInt("WorkOutTimer", (30));
        workTime = 30;
      }
      else{
        workTime = workTime! + 10;
        prefs.setInt("WorkOutTimer", workTime!);
      }
    });
  }

  void setMinusWorkTime() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      if (workTime! <= 30) {
        prefs.setInt("WorkOutTimer", (30));
        workTime = 30;
      } else {
        workTime = workTime! - 10;
        prefs.setInt("WorkOutTimer", (workTime!));
      }
    });
  }

  void changeGender() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      gender = !gender!;
      prefs.setBool("Gender", gender!);
    });
  }

  void readRestTime() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      restTime = prefs.getInt("RestTime");
      restTime ??= 25;
    });
  }

  void setPlusRestTime() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      if (restTime! >= 60) {
        prefs.setInt("RestTime", (5));
        restTime = 5;
      } else {
        restTime = restTime! + 5;
        prefs.setInt("RestTime", (restTime!));
      }
    });
  }

  void readWorkTime() async{
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      workTime = prefs.getInt("WorkOutTimer");
      workTime ??= 60;
    });
  }

  void setMinusRestTime() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      if (restTime! <= 5) {
        prefs.setInt("RestTime", (60));
        restTime = 60;
      } else {
        restTime = restTime! - 5;
        prefs.setInt("RestTime", (restTime!));
      }
    });
  }
}
