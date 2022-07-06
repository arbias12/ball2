import 'package:ball2/pages/hauptmenu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';    //im pubspec.yaml geändert!

import 'package:ball2/model/spieler.dart';
import 'package:ball2/pages/koordinaten.dart';

void main() {
  //initialize data
  AlleSpieler data = AlleSpieler();
  runApp(SpielerApp(data));
}

class SpielerApp extends StatelessWidget{
  AlleSpieler data;

  SpielerApp(this.data, {Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AlleSpieler>(
        create: (_) => data,
        child: MaterialApp(
            title: 'Bigeri App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: KonfigurationsPage()
        )
    );
  }
}