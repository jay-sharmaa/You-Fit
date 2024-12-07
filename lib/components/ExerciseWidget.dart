import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youfit/components/DetailsExerciseWidget.dart';

class ExerciseWidget extends StatefulWidget {
  final List<Map<String, dynamic>>? workOut;

  const ExerciseWidget({super.key, required this.workOut});

  @override
  State<ExerciseWidget> createState() => _ExerciseWidgetState();
}

class _ExerciseWidgetState extends State<ExerciseWidget> {
  String diff = "";

  @override
  void initState() {
    super.initState();
    getDiff();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 600,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.blueAccent.shade100,
                ),
                child: ListView.builder(
                  itemCount: widget.workOut?.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailsExerciseWidget(
                                workOutDetail: widget.workOut![index],
                              );
                            },
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 200,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Muscles: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.redAccent,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      Text(
                                        widget.workOut![index]['Muscles'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "WorkOut: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.redAccent,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      Text(
                                        widget.workOut![index]['WorkOut'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Intensity Level: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.redAccent,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      Text(
                                        widget.workOut![index]
                                            ['Intensity_Level'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Equipment: ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.redAccent,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      Text(
                                        widget.workOut![index]['Equipment'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Explanation: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.redAccent,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      SizedBox(
                                        width: 300,
                                        child: Text(
                                          widget.workOut![index]
                                              ['Explaination'],
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: Container(
                                      height: 3,
                                      width: 380,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
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

  void getDiff() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      diff = prefs.getString("Diff")!;
    });
  }
}
