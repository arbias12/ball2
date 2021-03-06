
import 'package:ball2/pages/game.dart';
import 'package:ball2/pages/konfiguration.dart';
import 'package:ball2/pages/info.dart';
import 'package:ball2/pages/list.dart';
import 'package:ball2/pages/spiel.dart';
import 'package:shake/shake.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ball2/model/spieler.dart';
import 'package:ball2/pages/koordinaten.dart';

class KonfigurationsPage extends StatefulWidget {
  @override
  _KonfigurationsPageState createState() => _KonfigurationsPageState();

}

class _KonfigurationsPageState extends State<KonfigurationsPage>{
  int _zaheler = 0;


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
                icon: Icon(Icons.phone_android),
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
        body: SingleChildScrollView(child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, mainAxisSize: MainAxisSize.max, children: [SizedBox(height: 5,), Image.asset('images/titelbild.png', height: 500,), SizedBox(height: 55,),
          SizedBox(height: 5,),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * 0.7,
              buttonColor: Theme.of(context).primaryColorLight,
              child: Column(children:[
                  ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize:Size(120, 50)),
                    onPressed:()  {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            if(_zaheler == 0) {
                              _zaheler++;
                              return DropdownDemo();
                            }else{
                              return MyApp();
                            }
                          })
                      );
                    },
                    child: Text("Spielen", style: TextStyle(fontSize: 10),),
                  ),
                SizedBox(height: 15,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize:Size(120, 50)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return DropdownDemo();
                        })
                    );
                  },
                  child: Text("Konfiguration", style: TextStyle(fontSize: 10),),
                )
            ]
              ),
            ),


        ],)
        )
        )
    );
  }
  void increment(){
    setState(() {
      _zaheler++;
    });
  }
}
