import 'dart:io';

import 'package:flutter/material.dart';

import 'Test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var test = Test();
    return MaterialApp(
      title: 'For tests',
      theme: ThemeData(
        // This is the theme of application.
        primarySwatch: Colors.purple,
      ),
      // home: MyHomePage('For tests', test.show_current_question()),
      home: MyHomePage(
        title: "Сборник тестов",
        question_text: test.show_current_question(),
        //answer1: test.get_first_answer(),
        //answer2: test.get_second_answer(),
        answs: test.get_all_answers(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
    required this.title,
    required this.question_text,
   // required this.answer1,
    //required this.answer2,
    required this.answs,
  }) : super(key: key);
  String question_text;
  //String answer1;
  //String answer2;
  List<String> answs;

  final String title;

  @override
  State<MyHomePage> createState() =>
      //_MyHomePageState(this.question_text, this.answer1, answer2, answs);
  _MyHomePageState(this.question_text, this.answs);
}

class _MyHomePageState extends State<MyHomePage> {
  var test = Test();
  var question_text = '';
  //var answer1 = '';
  //var answer2 = '';
  var visability = true;
  List <String> answer_list = [];

//var question_text = test.show_current_question();
  //_MyHomePageState(this.question_text, this.answer1, this.answer2, this.answer_list);
  _MyHomePageState(this.question_text, this.answer_list);

  void _nextQuestion() {
    setState(() {
      //question_text = test.go_to_next_question();
      if (!test.is_not_last_question()) {
        test.change_number();
        question_text = test.show_current_question();
        //answer1 = test.get_first_answer();
        //answer2 = test.get_second_answer();

        answer_list = test.get_all_answers();
      } else {
        visability = !test.is_not_last_question();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // var test = Test();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        //width: 400,
        //height: 600,
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(
            //width: 400,
            //height: 700,
            ),
        decoration: const BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/2.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(1.0)),
        ),
        child: Visibility(
          visible: visability,
          //replacement: Image.asset("assets/3.jpg"),
          replacement: Container(
            //padding: const EdgeInsets.only(left: 30, right: 30, top:150, bottom: 200),
            //constraints: const BoxConstraints.expand(
            //width: 400,
            //height: 700,
            //),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Text(
                      ('Ты ответил правильно на ${test.get_result()} вопросов. \n ${test.show_wrong_answers()}'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white, // цвет текста
                        fontSize: 25, // высота шрифта
                        //backgroundColor: Colors.white24
                      ),
                    ),
                  ),
                  //Spacer(),
                  ElevatedButton(
                      child: Text('Запустить заново'),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 20),
                          textStyle: const TextStyle(
                              color: Colors.white, fontSize: 30)),
                      onPressed: () {
                        visability = true;
                        test = Test();
                        test.current_number = -1;
                        _nextQuestion();
                      }),
                ]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //Image.asset("1.png", width: 320, height: 240),

              Padding(
                padding: EdgeInsets.all(5),
                //child:Text(( test.show_current_question()),
                child: Text(
                  ('$question_text'),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    //backgroundColor: Colors.white24
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: test.how_much_answers(),
                      itemBuilder: (BuildContext context, int index) {
                        return  Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                        Padding(
                        padding: EdgeInsets.all(5),
                            child: ElevatedButton(
                                child: Text(
                                  '${answer_list[index]}',
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.purple,
                                    padding: const EdgeInsets.only(
                                    left: 40,
                                    right: 40,
                                    top: 20,
                                    bottom: 20),
                                    textStyle: const TextStyle(
                                        color: Colors.white, fontSize: 35)),
                                onPressed: () {
                                  test.check_answer(test.current_number, index);
                                  _nextQuestion();
                                }),
                        ),
                        ],
                        );
                      }

                      // Padding(
                      //   padding: EdgeInsets.all(5),
                      //   child: ElevatedButton(
                      //       child: Text('$answer2'),
                      //       // style: ElevatedButton.styleFrom(
                      //       //      primary: Colors.purple,
                      //       //      padding: const EdgeInsets.symmetric(
                      //       //          horizontal: 60,
                      //       //          vertical: 20),
                      //       style: ElevatedButton.styleFrom(
                      //           primary: Colors.purple,
                      //           padding: const EdgeInsets.only(
                      //               left: 40, right: 40, top: 20, bottom: 20),
                      //           textStyle:
                      //               const TextStyle(color: Colors.white, fontSize: 35)),
                      //       onPressed: () {
                      //         test.check_answer(test.current_number, 1);
                      //         _nextQuestion();
                      //       }),
                      )),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
