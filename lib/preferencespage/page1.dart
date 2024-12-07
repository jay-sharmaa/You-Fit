import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: <Color>[
                  Color(0x811000ff),
                  Color(0xcc0000ff),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText("HELLO, ",
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TyperAnimatedText("WE WELCOME YOU FROM OUR TEAM, ",
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
                pause: const Duration(milliseconds: 1200),
                totalRepeatCount: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
