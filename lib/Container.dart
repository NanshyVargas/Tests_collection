import 'package:flutter/material.dart';

import 'Question.dart';

class Container {
  late List <Question> questions;

  Container() {
    questions = [];
    var answer1 = ('да');
    var answer2 = ('нет');
    var answer3 = ('lol');
    var answer4 = ('kek');
    var answer5 = ('cheburek');

    var question1 = Question(0, 'Ты дурак?', [answer1, answer2], 0);
    var question2 = Question(1, 'Ты пуся?', [answer1, answer2], 0);
    var question3 = Question(2, 'Ты какуся?', [answer1, answer2], 0);

    questions.add(question1);
    questions.add(question2);
    questions.add(question3);
  }
}