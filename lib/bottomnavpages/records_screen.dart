import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youfit/components/history.dart';

class recordsscreen extends StatefulWidget {
  const recordsscreen({super.key});

  @override
  State<recordsscreen> createState() => _recordsscreenState();
}

class _recordsscreenState extends State<recordsscreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
        children: [
          Expanded(child: History())
        ],
      ),
    );
  }
}
