import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:youfit/GetApiData.dart';
import 'package:youfit/components/ExerciseWidget.dart';
import 'package:youfit/providers/user_provider.dart';

class trainingscreen extends StatefulWidget {
  const trainingscreen({super.key});

  @override
  State<trainingscreen> createState() => _trainingscreenState();
}

class _trainingscreenState extends State<trainingscreen> {
  final workout = GetApiData();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<userProvider>(context).user;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 7,
            child: const WeekGoal(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: const SpecialExercises(),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: FutureBuilder(
                  future: workout.fetchWorkouts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                      } else {
                        final data = snapshot.data!;
                        return Padding(
                          padding: const EdgeInsets.all(7.5),
                          child: ExerciseWidget(workOut: data),
                        );
                      }
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SpecialExercises extends StatefulWidget {
  const SpecialExercises({super.key});

  @override
  State<SpecialExercises> createState() => _SpecialExercisesState();
}

class _SpecialExercisesState extends State<SpecialExercises> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          //First Image
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
            child: GestureDetector(
              child: Container(
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0, top: 8.0),
                      child: Text(
                        "Jumpin Jacks",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ),
                    Center(
                      child: Image(
                        image: const AssetImage(
                            "assets/jumping_jack.jpeg"),
                        height: MediaQuery.of(context).size.height / 5,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Sensors(temp: 1);
                }));
              },
            ),
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0, top: 8.0),
                      child: Text(
                        "Pull Ups",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ),
                    Image(
                      image: AssetImage("assets/Mpr_sem_4_youfit_pullup.jpeg"),
                      height: MediaQuery.of(context).size.height / 6,
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Sensors(temp: 2);
              }));
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
            child: GestureDetector(
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0, top: 8.0),
                      child: Text(
                        "Squats",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ),
                    Image(
                      image: const AssetImage(
                          "assets/squat_man.jpeg"),
                      height: MediaQuery.of(context).size.height / 6,
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Sensors(temp: 3);
                }));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WeekGoal extends StatefulWidget {
  const WeekGoal({super.key});

  @override
  State<WeekGoal> createState() => _WeekGoalState();
}

class _WeekGoalState extends State<WeekGoal> {
  List<int> dates = [
    DateTime.now().day - 6,
    DateTime.now().day - 5,
    DateTime.now().day - 4,
    DateTime.now().day - 3,
    DateTime.now().day - 2,
    DateTime.now().day - 1,
    DateTime.now().day
  ];
  int? goal = 0;

  @override
  void initState() {
    super.initState();
    getGoal();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "WEEK GOAL",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Change Goal"),
                          content: const Text(
                              "Change the number of days you want to workout"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                setMinusGoalTime();
                              },
                              child: const Text(
                                "-",
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setPlusGoalTime();
                              },
                              child: const Text(
                                "+",
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                          ],
                        );
                      });
                },
                child: const Icon(Icons.edit),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  goal.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 12,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    child: Text(dates[0].toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    child: Text(dates[1].toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    child: Text(dates[2].toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    child: Text(dates[3].toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    child: Text(dates[4].toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    child: Text(dates[5].toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Text(dates[6].toString()),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void getGoal() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      goal = prefs.getInt("RestTime");
      goal ??= 3;
    });
  }

  void setPlusGoalTime() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      if (goal! >= 7) {
        prefs.setInt("RestTime", (1));
        goal = 1;
      } else {
        goal = goal! + 1;
        prefs.setInt("RestTime", (goal!));
      }
    });
  }

  void setMinusGoalTime() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      if (goal! <= 1) {
        prefs.setInt("RestTime", (7));
        goal = 7;
      } else {
        goal = goal! - 1;
        prefs.setInt("RestTime", (goal!));
      }
    });
  }
}

class Sensors extends StatefulWidget {
  final int temp;
  const Sensors({required this.temp, super.key});
  @override
  State<Sensors> createState() => _SensorsState();
}

class _SensorsState extends State<Sensors> {
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              x = 0;
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  content: Countdown(interval: Duration(milliseconds: 1000),seconds: 20, build: (context, time){
                    return SizedBox(
                      height: 350,
                        child: Center(child:Text(time.toString(), style: TextStyle(fontSize: 60))));
                  }),
                );
              });
              Timer.periodic(const Duration(seconds: 20), (timer) {
              setState(() {

                print(acceleration());
                if (acceleration() >= 1) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Fantastic!!"),
                          content: const Text("You Did A Great Job"),
                          actions: <Widget>[
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Return Back To Home Page"))
                          ],
                        );
                      });
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Whoops"),
                          content: const Text(
                              "Looks like we were not able to record it could you try again"),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Try Again"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Return Back"),
                            )
                          ],
                        );
                      });
                  }
              });
              });
            },
            icon: const Icon(Icons.spatial_audio),
          )
        ],
        title: const Text("YouFiT"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.blue.shade300),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: const Text(
              "You can start doing your jumping jacks after clicking on the top right icon",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  int acceleration() {
    accelerometerEventStream(samplingPeriod: SensorInterval.normalInterval)
        .listen((event) {
      if (event.x > 0 || event.x < 0) {
        x += 1;
      } else {
        x += 0;
      }
    }, onError: (error) {
      x += 0;
    });
    print(x);
    return x;
  }
}
