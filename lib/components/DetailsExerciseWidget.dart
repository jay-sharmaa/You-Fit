import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer_count_down/timer_count_down.dart';

class DetailsExerciseWidget extends StatefulWidget {
  final Map<String, dynamic> workOutDetail;

  const DetailsExerciseWidget({required this.workOutDetail, super.key});

  @override
  State<DetailsExerciseWidget> createState() => _DetailsExerciseWidgetState();
}

class _DetailsExerciseWidgetState extends State<DetailsExerciseWidget> {
  String diff = "";
  int? caloriesBurned = 0;
  int? minuteWorked = 0;
  int? workoutNum = 0;
  int? time = 60;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDiff();
    getCalo();
    getWork();
    getNum();
    timePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.spatial_audio))
        ],
        title: const Text("YouFiT"),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Image(image: AssetImage("assets/image1.jpg"),
              height: 300,),
              const Divider(
                thickness: 3,
                color: Colors.grey,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Container(
                          color: Colors.blueAccent,
                          height: 12,
                          width: 5,
                        ),
                        const Text(
                          " Muscles: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          widget.workOutDetail[diff] ??= "Beginner",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1, color: Colors.grey.shade300),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Container(
                          color: Colors.blueAccent,
                          height: 12,
                          width: 5,
                        ),
                        const Text(
                          " Equipment: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          widget.workOutDetail['Equipment'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1, color: Colors.grey.shade300),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Container(
                          color: Colors.blueAccent,
                          height: 12,
                          width: 5,
                        ),
                        const Text(
                          " Explanation:  ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width/1.5,
                            child: Text(
                              widget.workOutDetail['Long Explanation'],
                              maxLines: 5,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1, color: Colors.grey.shade300),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Container(
                          color: Colors.blueAccent,
                          height: 12,
                          width: 5,
                        ),
                        const Text(
                          " Video:  ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: 270,
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                widget.workOutDetail['Video'],
                                maxLines: 5,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1, color: Colors.grey.shade300),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  //callNotification()
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        child: AlertDialog(
                          title: const Text("Timer"),
                          content: SizedBox(
                            height: MediaQuery.of(context).size.width / 2,
                            width: MediaQuery.of(context).size.height / 3,
                            child: Countdown(
                                seconds: 10,
                                interval: Duration(milliseconds: 100),
                                onFinished: (){
                                  setCalo();
                                  setWork();
                                  setNum();
                                  getDiff();
                                  getDiffUpdate();
                                  Navigator.pop(context);
                                },
                                build: (context, time){
                              return Center(child: Text(time.toString(), style: TextStyle(fontSize: 60),));
                            }),

                          ),
                        ),
                      );
                    },
                  );
                },
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(4),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue.shade300),
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                child: const Text("Start"),
              ),
            ),
          )
        ],
      ),
    );
  }

  void getDiff() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      diff = prefs.getString("Diff")!;
    });
  }

  void getCalo() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      caloriesBurned = prefs.getInt("Calo");
      caloriesBurned ??= 0;
    });
  }

  void setCalo() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setInt("Calo", (caloriesBurned! + 3));
      caloriesBurned = caloriesBurned! + 3;
    });
  }

  void getWork() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      workoutNum = prefs.getInt("Work");
      workoutNum ??= 0;
    });
  }

  void setWork() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setInt("Work", (workoutNum! + 1));
      workoutNum = workoutNum! + 1;
    });
  }

  void getDiffUpdate() async{
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      if(workoutNum! >= 17){
        prefs.setString("Diff", "Expert Sets");
      }
      else if(workoutNum! >= 7){
        prefs.setString("Diff", "Intermediate Sets");
      }
    });
  }

  void getNum() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      minuteWorked = prefs.getInt("Minute");
      minuteWorked ??= 0;
    });
  }

  void setNum() async {
    int increment = 0;
    if (diff == "Beginner Sets") {
      increment = 1;
    } else if (diff == "Intermediate Sets") {
      increment = 2;
    } else {
      increment = 3;
    }
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setInt("Minute", (minuteWorked! + increment));
      minuteWorked = minuteWorked!  + increment;
    });
  }

  void timePicker() async{
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      time = prefs.getInt("WorkOutTimer");
    });
  }
}
