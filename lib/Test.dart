import 'Container.dart';
import 'Question.dart';

class Test {
  late List<Question> questions;
  late int length = questions.length;
  int current_number = 0;
  int result = 0;
  String wrong_answers = '';

  Test() {
    var container = Container();
    questions = container.questions;
  }

  void check_answer(int question_number, int answer) {
    print("res: ${questions[question_number].correct_answer_id == answer}, ${result}");
    if (questions[question_number].correct_answer_id == answer) {
      result += 1;}
      else {
    wrong_answers += '\n В вопросе номер ${question_number+1} ответ "${questions[question_number].answers[answer].toString()}" неверный';
    };

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

  List<String> get_all_answers() {
    return questions[current_number].answers;
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

  String show_wrong_answers()
  {
    String output = '';
    if (wrong_answers == '')
    {
      output = 'Все ответы верны. Ты молодец!';
    }
    else
      {
        output = 'Список неправильных ответов: $wrong_answers';
      }


    return output;
  }
  int how_much_answers() {
    int output = questions[current_number].answers.length;
        return output;
  }
}

