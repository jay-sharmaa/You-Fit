import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youfit/mydrawerbasic.dart';
import 'package:youfit/services/services.dart';

class Drawerpage1 extends StatefulWidget {
  const Drawerpage1({super.key});

  @override
  State<Drawerpage1> createState() => _drawerpage1State();
}

class _drawerpage1State extends State<Drawerpage1> {
  final authservices = services();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Youfit"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        color: Colors.black
      )
    );
  }
}
