import 'dart:io';

import 'package:flutter/material.dart';

import 'Test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var test = Test();
    return MaterialApp(
      title: 'For tests',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
      // home: MyHomePage('For tests', test.show_current_question()),
      home: MyHomePage(
        title: "Сборник тестов",
        question_text: test.show_current_question(),
        answer1: test.get_first_answer(),
        answer2: test.get_second_answer(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
    required this.title,
    required this.question_text,
    required this.answer1,
    required this.answer2,
  }) : super(key: key);
  String question_text;
  String answer1;
  String answer2;

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() =>
      _MyHomePageState(this.question_text, this.answer1, answer2);
}

class _MyHomePageState extends State<MyHomePage> {
  var test = Test();
  var question_text = '';
  var answer1 = '';
  var answer2 = '';
  var visability = true;

//var question_text = test.show_current_question();
  _MyHomePageState(this.question_text, this.answer1, this.answer2);

  void _nextQuestion() {
    setState(() {
      //question_text = test.go_to_next_question();
      if (!test.is_not_last_question()) {
        test.change_number();
        question_text = test.show_current_question();
        answer1 = test.get_first_answer();
        answer2 = test.get_second_answer();
      } else {
        visability = !test.is_not_last_question();
      }

      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    // var test = Test();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        //width: 400,
        //height: 600,
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 600,
        ),
        decoration: const BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/2.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Visibility(
          visible: visability,
          //replacement: Image.asset("assets/3.jpg"),
          replacement: Column(children: [
            Text(
              ('Ты ответил правильно на ${test.get_result()} вопросов'),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blueAccent, // цвет текста
                  fontSize: 35, // высота шрифта
                  backgroundColor: Colors.white24),
            ),
            ElevatedButton(
                child: Text('Запустить заново'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    textStyle: const TextStyle(
                        decorationColor: Colors.amber,
                        color: Colors.white,
                        fontSize: 30)),
                onPressed: () {
                  visability = true;
                  test = Test();
                  test.number = -1;
                  _nextQuestion();
                }),]),
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Image.asset("1.png", width: 320, height: 240),

              Padding(
                padding: EdgeInsets.all(5),
                //child:Text(( test.show_current_question()),
                child: Text(
                  ('$question_text'),
                  //(test.get_number().toString()),
                  style: TextStyle(
                      color: Colors.blueAccent, // зеленый цвет текста
                      fontSize: 35, // высота шрифта 26
                      backgroundColor: Colors.white24),
                ),
              ),

              Padding(
                  padding: EdgeInsets.all(5),
                  child: ElevatedButton(
                      //child: Text(test.get_first_answer(),),
                      child: Text(
                        '$answer1',
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          textStyle: const TextStyle(
                              color: Colors.white, fontSize: 30)),
                      onPressed: () {
                        test.check_answer(test.number, 0);
                        _nextQuestion();
                      })),
              Padding(
                padding: EdgeInsets.all(5),
                child: ElevatedButton(
                    child: Text('$answer2'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        textStyle: const TextStyle(
                            decorationColor: Colors.amber,
                            color: Colors.white,
                            fontSize: 30)),
                    onPressed: () {
                      test.check_answer(test.number, 1);
                      _nextQuestion();
                    }),
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
