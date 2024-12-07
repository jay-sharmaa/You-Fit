import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youfit/screens/home_screen.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  var check = 0;

  void checkVar() {
    check = 1;
  }

  var snackBar = const SnackBar(
    content: Text('Please select a Mode!'),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 500,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[
                Color(0x551000ff),
                Color(0xbb0000ff),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        setDiff("Beginner Sets");
                        checkVar();
                      },
                      child: Container(
                        width: 110,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: <Color>[
                                Color(0x747071dd),
                                Color(0xbb0000ff)
                              ]),
                        ),
                        child: Center(
                          child: Text(
                            "Beginner",
                            style:
                                TextStyle(color: Colors.purpleAccent.shade100),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        setDiff("Intermediate Sets");
                        checkVar();
                      },
                      child: Container(
                        width: 110,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: <Color>[
                                Color(0x747071dd),
                                Color(0xbb0000ff)
                              ]),
                        ),
                        child: Center(
                          child: Text(
                            "Intermediate",
                            style:
                                TextStyle(color: Colors.purpleAccent.shade100),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        setDiff("Expert Sets");
                        checkVar();
                      },
                      child: Container(
                        width: 110,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: <Color>[
                                Color(0xaa7071ff),
                                Color(0xbb0000ff)
                              ]),
                        ),
                        child: Center(
                          child: Text(
                            "Expert",
                            style:
                                TextStyle(color: Colors.purpleAccent.shade100),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      "WE HOPE YOU MAKE THE MOST OF IT,",
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TyperAnimatedText(
                      "YOU CAN ALWAYS COME BACK TO THIS",
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                  pause: const Duration(milliseconds: 1200),
                  totalRepeatCount: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () {
                    check == 1
                        ? Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                          return const HomeScreen();
                        }))
                        : ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Container(
                    width: 110,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.purple.shade100),
                    child: Center(
                      child: Text(
                        "GET STARTED!!",
                        style: TextStyle(color: Colors.blueAccent.shade400),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setDiff(String diff) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("Diff", diff);
  }
}
