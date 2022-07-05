import 'package:flutter/material.dart';

class Spieler extends ChangeNotifier{
  late String _firstname;
  late String _lastname;
  late int _punkte;


  Spieler(String _firstname, String _lastname){
    this._firstname = _firstname;
    this._lastname = _lastname;
    this._punkte = 0;
  }

  int get punkte => _punkte;
  String get firstname => _firstname;
  String get lastname => _lastname;
}

class AlleSpieler extends ChangeNotifier{
  late List<Spieler> _spieler = [Spieler("Arbias", "Imeri"), Spieler("Martin", "Düppi"), Spieler("Sarah", "Frischi")];

  List<Spieler> get spieler => List.unmodifiable(_spieler);


  void add(Spieler spieler){
    _spieler.add(spieler);
    notifyListeners();
  }
}