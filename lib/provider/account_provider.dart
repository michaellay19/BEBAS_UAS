import 'package:flutter/material.dart';
import 'dart:convert';

class AccountProvider extends ChangeNotifier {
  initialData() async {
    setData = null;
  }
  
  final hansen = {
    "data": {
      "nama": "Hansen Tanio",
      "username": "hansentanio33",
      "password": "hansen123",
    },
  };
  final louis = {
    "data": {
      "nama": "Louis Lie",
      "username": "louislie57",
      "password": "louis123",
    },
  };
  final victor = {
    "data": {
      "nama": "Victor",
      "username": "v39309",
      "password": "victor123",
    },
  };
  dynamic _data;
  dynamic get data => _data;
  set setData(val) {
    var tmp = json.encode(val);
    _data = json.decode(tmp);
    notifyListeners();
  }

  login(username, password) {
    if (username == 'hansentanio33' && password == 'hansen123') {
      setData = hansen;
    } else if (username == 'louislie57' && password == 'louis123') {
      setData = louis;
    } else if (username == 'v39309' && password == 'victor123') {
      setData = victor;
    } else {
      setData = null;
    }
  }
}
