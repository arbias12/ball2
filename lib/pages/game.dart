
import 'package:ball2/pages/info.dart';
import 'package:ball2/pages/list.dart';
import 'package:shake/shake.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ball2/model/spieler.dart';
import 'package:ball2/pages/spieler_page.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();

}

class _GamePageState extends State<GamePage>{
  forceRedraw() {
    setState(() => {});
  }

  @override
  void initState() {
    super.initState();

    ShakeDetector.autoStart(
        onPhoneShake: forceRedraw
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Biggeri App", style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.info),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return InfoPage();
                      })
                  );
                }

            ),
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return SpielerPage();
                      })
                  );
                }
            ),
            IconButton(
                icon: Icon(Icons.list),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return Listpage();
                      })
                  );
                }
            )
          ],
        ),
        body: Center(
        child: Column(children: [Image.asset('images/titelbild.png', height: 500,), Text("Start Game", style: TextStyle(fontSize: 25), textAlign: TextAlign.center)],)
        )
    );
  }
}