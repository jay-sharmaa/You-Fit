import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../components/numtext.dart';

class settingscreen extends StatefulWidget {
  const settingscreen({super.key});

  @override
  State<settingscreen> createState() => _settingscreenState();
}

class _settingscreenState extends State<settingscreen> {
  int workOut = 0;
  int cal = 0;
  int minute = 0;
  String diff = "";
  int session = 7;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    getDiff();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NumText(
                        num: workOut,
                        text: "Workout",
                      ),
                      NumText(
                        num: cal,
                        text: "Cal",
                      ),
                      NumText(
                        num: minute,
                        text: "Minute",
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 300,
              width: 300,
              child: SfCartesianChart(
                primaryXAxis: const CategoryAxis(),
                series: <LineSeries<DataClass, int>>[
                  LineSeries<DataClass, int>(
                      dataSource: <DataClass>[
                        DataClass(
                            day: DateTime.now().day - 2, caloriesBurned: 5),
                        DataClass(
                            day: DateTime.now().day - 1, caloriesBurned: 7),
                        DataClass(
                            day: DateTime.now().day, caloriesBurned: workOut),
                      ],
                      xValueMapper: (DataClass data, _) => data.day,
                      yValueMapper: (DataClass data, _) => data.caloriesBurned)
                ],
              ),
            ),
            SizedBox(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: ListView.builder(
                  itemCount: session,
                  itemBuilder: (context, index) {
                    return TimeLine(
                      isFirst: index == 0,
                      isLast: index == session - 1,
                      isPast: logic(index, workOut),
                      index: index + 1,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getData() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      cal = prefs.getInt("Calo")!;
      workOut = prefs.getInt("Work")!;
      minute = prefs.getInt("Minute")!;
    });
  }

  void getDiff() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      diff = prefs.getString("Diff")!;
      if (diff == "Beginner Sets") {
        session = 7;
      } else if (diff == "Intermediate Sets") {
        session = 10;
      } else {
        session = 12;
      }
    });
  }
}

class TimeLine extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final int index;

  const TimeLine(
      {required this.isFirst,
      required this.isLast,
      required this.isPast,
      required this.index,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle:
            LineStyle(color: isPast ? Colors.blue : Colors.blue.shade100),
        indicatorStyle: IndicatorStyle(
          width: 40,
          color: Colors.blueAccent,
          iconStyle: IconStyle(iconData: Icons.done, color: isPast? Colors.white : Colors.blue),
        ),
        endChild: Padding(
          padding: const EdgeInsets.only(left: 20),
            child: Text(
          "Session $index",
          style: const TextStyle(color: Colors.blueAccent),
        )),
      ),
    );
  }
}

class DataClass {
  final int day;
  final int caloriesBurned;

  DataClass({required this.day, required this.caloriesBurned});
}

bool logic(int index, int workout) {
  if (index < workout) {
    return true;
  }
  return false;
}
