import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorCheck extends StatefulWidget {
  const SensorCheck({super.key});

  @override
  State<SensorCheck> createState() => _SensorCheckState();
}

class _SensorCheckState extends State<SensorCheck> {
  double x = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    x = acceleration();
    Timer.periodic(Duration( milliseconds: 500), (timer) {
      setState(() {
        setState(() {
          x = acceleration();
        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Text(x.toString());
  }

  double acceleration() {
    double x_ = 0;
    accelerometerEventStream(samplingPeriod: SensorInterval.normalInterval)
        .listen((event) {
      x_ = event.x;
    });
    print(x_);
    return x_;
  }
}
