import 'dart:async';
import 'package:ball2/model/object.dart';
import 'package:flutter/material.dart';
import 'package:ball2/model/gameImage.dart';
import 'package:sensors_plus/sensors_plus.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'letsgo M335'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double xValue = 0;
  double yValue = 0;

  double xStart = 0;
  double yStart = 500;
  double xTarget = 0;
  double yTarget = 10;

  bool getippt = false;
  late StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    subscription = accelerometerEvents.listen((event) {
      setState(() {
        moveImg(event.x);
        moveRock();
      });
    });
  }

  void moveImg(double effectiveX) {
    double theEffectiveX = effectiveX;
    setState(() {
      if (theEffectiveX > 2.2) {
        theEffectiveX = 2.2;
      } else if (theEffectiveX < -2.2) {
        theEffectiveX = -2.2;
      }
      xValue = theEffectiveX / 2.2 * -1;
    });
  }
  void moveRock() {
    setState(() {2
     xStart = xTarget;
     yStart = yTarget;
    });
  }



  void setBoolean(){
    if(getippt == false){
      getippt = true;
    }else if(getippt == true){
      print("Bool true");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.grey,

          ),
          AnimatedPositioned(
            curve: Curves.linear,
            duration: Duration(milliseconds: 1000),
            top: yStart.toDouble(),
            left: xStart.toDouble(),
            child: Objekt()
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height*0.1,
              child: AnimatedContainer(
                color: Colors.grey,
                duration: Duration(milliseconds: 1000),
                alignment: Alignment(this.xValue, 0.7),
                child: GameImage(),
              )

          ),
          Positioned(
            child: ElevatedButton(
              child: Text("Start Game"),
              onPressed: (){
                moveRock();
              },
            ),
          )
        ],
      )
      /*
      /Column(
        children: [
          Expanded (
              flex: 4,
              child:GestureDetector(
                  onTap: setBoolean,
                  child: AnimatedContainer(
                    color: Colors.black,
                    duration: Duration(milliseconds: 1000),
                    alignment: Alignment(-1.0, rockYaxis),
                    child: Objekt(),
                  ))),
          Expanded(
              child: AnimatedContainer(
                color: Colors.grey,
                duration: Duration(milliseconds: 1000),
                alignment: Alignment(this.xValue, 0.7),
                child: GameImage(),
              ),
          ),



        ],
      )
      */
    ,


    );
  }
}