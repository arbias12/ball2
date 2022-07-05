import 'package:ball2/pages/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';    //im pubspec.yaml geändert!

import 'package:ball2/model/spieler.dart';
import 'package:ball2/pages/spieler_page.dart';

void main() {
  //initialize data
  AlleSpieler data = AlleSpieler();
  runApp(SpielerApp(data));  //= new CookieApp()
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
            home: GamePage()
        )
    );
  }
}