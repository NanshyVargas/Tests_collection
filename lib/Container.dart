import 'package:flutter/material.dart';

import 'Answer.dart';
import 'Question.dart';

class Container {
  late List <Question> questions;

  Container() {
    questions = [];
    var answer1 = Answer(0, 'да');
    var answer2 = Answer(1, 'нет');
    var answer3 = Answer(0, 'lol');
    var answer4 = Answer(1, 'kek');
    var answer5 = Answer(2, 'cheburek');

    var question1 = Question(0, 'Ты дурак?', [answer1, answer2], 0);
    var question2 = Question(1, 'Ты пуся?', [answer1, answer2], 0);
    var question3 = Question(2, 'Ты какуся?', [answer1, answer2], 0);
    // for (int i=0; i<3; i++)
    //   {
    //     questions.add()
    //   }
    questions.add(question1);
    questions.add(question2);
    questions.add(question3);
  }
}