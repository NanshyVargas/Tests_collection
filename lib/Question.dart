
class Question {
  late int id_question;
  late String question;
  late List<String> answers;
  late int correct_answer_id;

  Question(
      this.id_question, this.question, this.answers, this.correct_answer_id);

  @override
  String toString() {
    var text = "$question";
    return text;
  }
}
