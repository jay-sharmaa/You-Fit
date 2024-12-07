import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youfit/providers/user_provider.dart';

class NumText extends StatefulWidget {
  final String text;
  final int num;

  const NumText({super.key, required this.text, required this.num});

  @override
  State<NumText> createState() => _NumTextState();
}

class _NumTextState extends State<NumText> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<userProvider>(context).user;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(50, 145, 163, 176),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: SizedBox(
          height: 80,
          width: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.num.toString(),
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.text,
                style: const TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
