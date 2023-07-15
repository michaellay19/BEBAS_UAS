import 'package:flutter/material.dart';

class TProvider extends ChangeNotifier {
  String username = "";
  int saldo = 100000;
  String pin = "0000";
  String saldosementara = "";
  String statement = "";

  List listfeedcomment = [
    {
      "username": "Louis Lie",
      "comment": "Halo gais wellkam back to my channel"
    },
    {"username": "Hansen Tanio", "comment": "Yoo this is my first post ehe"},
    {"username": "Pieter Vardi", "comment": "Aha ha ha come back deck!"},
    {"username": "Victor", "comment": "CBB cuman bisa beatrix hha"},
  ];

  List users = [
    {
      "username": "Michael Lay",
      "pin": "0000",
      "saldo": 150000,
    },
  ];

  void addsaldo(int saldomasuk) {
    saldo = saldo + saldomasuk;
    notifyListeners();
  }

  void minsaldo(int saldomasuk) {
    saldo = saldo - saldomasuk;
    notifyListeners();
  }

  void addcomment(String username, String comment) {
    listfeedcomment
        .insert(0, {"username": "${username}", "comment": "${comment}"});
    notifyListeners();
  }
}
