import 'package:flutter/material.dart';

class GameImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('images/ball.png'),
      height: 60,
      width: 60,
    );
  }
}