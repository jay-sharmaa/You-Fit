import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int? workOut = 0;
  DateTime date1 = DateTime(2024, 4, DateTime.now().day - 1);
  DateTime date2 = DateTime(2024, 4, DateTime.now().day - 2);
  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    var num = DateTime.now().month - 1;
    if (num < 0) {
      num = 12;
    }
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: HeatMap(
              startDate: DateTime(2024, num % 13, DateTime.now().day),
              endDate: DateTime.now(),
              datasets: {
                date2: 5,
                date1: 7,
                DateTime(2024, 4, 27): workOut!,
              },
              colorMode: ColorMode.opacity,
              showText: true,
              scrollable: true,
              colorsets: const {
                1: Colors.orange,
                3: Colors.orange,
                5: Colors.yellow,
                7: Colors.green,
                9: Colors.blue,
                11: Colors.indigo,
                13: Colors.purple,
                18: Colors.red
              },
              showColorTip: false,
              onClick: (value) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(value.toString())));
              },
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
  void getData() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      workOut = prefs.getInt("Work")!;
    });
  }
}
