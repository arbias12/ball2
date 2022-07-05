import 'dart:async';

import 'package:sensors_plus/sensors_plus.dart';
import 'package:shake/shake.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ball2/model/spieler.dart';

class Listpage extends StatefulWidget {
  @override
  State<Listpage> createState() {
    return _ListStatus();
  }
}

class _ListStatus extends State<Listpage> {
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
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: AlleSpieler()
                .spieler
                .map((element) => Row (
                      children : [
                        Expanded(
                            child: Text(element.firstname,
                                textAlign: TextAlign.center)),
                        SizedBox(height: 20),
                        Expanded(
                            child: Text(element.lastname,
                                textAlign: TextAlign.center)),
                        SizedBox(height: 20),
                        Expanded(
                            child: Text(element.punkte.toString(),
                                textAlign: TextAlign.center))
                      ],
                    ))
                .toList()),
      ),
    );
  }

  sensorView(BuildContext context) {
    return Container();
  }
}
