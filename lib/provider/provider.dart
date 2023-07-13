import 'package:flutter/material.dart';

class TProvider extends ChangeNotifier {
  String username = "";
  List listfeedcomment = [
    {
      "username": "Louis Lie",
      "comment": "Halo gais wellkam back to my channel"
    },
    {"username": "Hansen Tanio", "comment": "Yoo this is my first post ehe"},
    {"username": "Pieter Vardi", "comment": "Aha ha ha come back deck!"},
    {"username": "Victor", "comment": "CBB cuman bisa beatrix hha"},
  ];

  void addcomment(String username, String comment) {
    listfeedcomment
        .insert(0, {"username": "${username}", "comment": "${comment}"});
    notifyListeners();
  }

  List listUserTopUp = [
    {
      "username": "Louis Lie",
      "pin": "123456",
      "saldo": 150000,
    },
    {
      "username": "Hansen Tanio",
      "pin": "234567",
      "saldo": 50000,
    },
    {
      "username": "Pieter Vardi",
      "pin": "345678",
      "saldo": 80000,
    },
    {
      "username": "Victor",
      "pin": "456789",
      "saldo": 20000,
    },
  ];
}
