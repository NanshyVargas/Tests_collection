import 'package:flutter/material.dart';

class Answer {
  int id;
  String text;
  Answer(this.id, this.text);

  @override String toString() {
    // TODO: implement toString
    return text;
  }
}