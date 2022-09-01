import 'package:for_test/Answer.dart';

class Question {
  late int id_question;
  late String question;
  late List<Answer> answers;
  late int correct_answer_id;

  Question(
      this.id_question, this.question, this.answers, this.correct_answer_id);

  @override
  String toString() {
    //for (var i = 0; i < answers.length; i++) {
      //answersText += "\n${i+1}) ${answers[i]}";
    //}
    var text = "$question";
    return text;
  }
}
