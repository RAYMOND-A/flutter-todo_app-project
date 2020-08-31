//import 'package:flutter/material.dart';

class Task {
  bool isDone;
  String name;

  Task({this.name, this.isDone = false});

  void toogleDone() {
    isDone = !isDone;
  }
}
