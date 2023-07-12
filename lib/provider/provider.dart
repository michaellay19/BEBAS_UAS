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
}
