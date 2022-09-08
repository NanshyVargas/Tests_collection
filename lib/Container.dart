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
    var answer6 = ('не знаю');

    var question1 = Question(0, 'Это flutter?', [answer1, answer2, answer6], 0);
    var question2 = Question(1, 'Мы программируем?', [answer1, answer2], 0);
    var question3 = Question(2, 'У нас все получится?', [answer1, answer2, answer6], 0);

    questions.add(question1);
    questions.add(question2);
    questions.add(question3);
  }
}