import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youfit/mydrawerbasic.dart';
import 'package:youfit/services/services.dart';

class Drawerpage2 extends StatefulWidget {
  const Drawerpage2({super.key});

  @override
  State<Drawerpage2> createState() => _drawerpage2State();
}

class _drawerpage2State extends State<Drawerpage2> {
  final authservices = services();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Youfit"),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
