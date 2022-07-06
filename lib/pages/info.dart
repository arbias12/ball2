import 'dart:async';

import 'package:sensors_plus/sensors_plus.dart';
import 'package:shake/shake.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ball2/model/spieler.dart';

class InfoPage extends StatefulWidget{
  @override
  State<InfoPage> createState() {
    return _InfoStatus();
  }

}
class _InfoStatus extends State<InfoPage>{
  late StreamSubscription subscription;


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
          child: Center(
            child: Column(children: [
              Text(
                  "Dieses Projekt wurde im überbetrieblichen Kurs, im Modul 335 durchgeführt",
                  style: TextStyle(fontSize: 40),
                  textAlign: TextAlign.center
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  "Der Sinn dieses Spieles ist es, denn Hindernissen auszuweichen, in dem man durch die Bewegungen mit dem Smartphone steuern kann.",
                  style: TextStyle(fontSize: 40),
                  textAlign: TextAlign.center
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                  "made by Arbias",
                  style: TextStyle(fontSize: 16, fontFamily: "yellowtail"),
                  textAlign: TextAlign.center
              )
            ],)

          ),
      ),
      )
    );
  }

  sensorView(BuildContext context) {
    return Container();
  }



}