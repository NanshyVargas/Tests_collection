import 'Container.dart';
import 'Question.dart';

class Test {
  late List<Question> questions;
  late int length = questions.length;
  int current_number = 0;
  int result = 0;

  Test() {
    var container = Container();
    questions = container.questions;
  }

  void check_answer(int question_number, int answer) {
    print("res: ${questions[question_number].correct_answer_id == answer}, ${result}");
    if (questions[question_number].correct_answer_id == answer) {
      result += 1;
      print("++ ${result}");
    }
  }

  String show_current_question() {
    return questions[current_number].toString();
  }

  String go_to_next_question() {
    return questions[current_number + 1].toString();
  }

  void change_number() {
    current_number += 1;
  }

  Question get_current_question() {
    return questions[current_number];
  }

  String get_first_answer() {
    return questions[current_number].answers[0].toString();
  }

  String get_second_answer() {
    return questions[current_number].answers[1].toString();
  }

  String show_result() {
    return result.toString();
  }

  bool is_not_last_question() {
    return current_number == length - 1;
  }

  int get_number() {
    return current_number;
  }
  int get_result(){
    return result;
  }
}
