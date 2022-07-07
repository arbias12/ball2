import 'package:ball2/model/spieler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class DropdownDemo extends StatefulWidget {

  const DropdownDemo({Key? key}) : super(key: key);
  @override
  State<DropdownDemo> createState() => _DropdownDemoState();
}
class _DropdownDemoState extends State<DropdownDemo> {
  String dropdownValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            // Step 2.
            DropdownButton<String>(
              // Step 3.
              value: null,
              // Step 4.
              items:AlleSpieler().spieler.map((e) => e.firstname).toList()
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 30),
                  ),
                );
              }).toList(),
              // Step 5.
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Selected Value: $dropdownValue',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40,)
            ,
            Text(
              "Start Game",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
            ,
            SizedBox(height: 40,)
            ,
            IconButton(
                icon: Icon(Icons.not_started, size: 40.0,),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return DropdownDemo();
                      })
                  );
                }
            )
          ],
        ),
      ),
      )
    );
  }
}
