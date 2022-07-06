import 'dart:async';

import 'package:sensors_plus/sensors_plus.dart';
import 'package:shake/shake.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ball2/model/spieler.dart';

class SpielerPage extends StatefulWidget{
  @override
  State<SpielerPage> createState() {
    return _SpielerState();
  }

}
class _SpielerState extends State<SpielerPage>{
  double _x = 0, _y = 0, _z = 0;
  late StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    subscription = accelerometerEvents.listen((event) {
      setState(() {
        _x = event.x;
        _y = event.y;
        _z = event.z;
      });
    });
  }
  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(child: Center(
        child: Column(
          children: [
            sensorView(context),
            Text("x: $_x"),
            Text("y: $_y"),
            Text("z: $_z"),
          ],
        ),
      ),
      )
    );
  }

  sensorView(BuildContext context) {
    return Container();
  }



}