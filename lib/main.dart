import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';

import './question.dart';
import './answer.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': '5'},
        {'text': 'Blue', 'score': 20},
        {'text': 'White', 'score': 10},
      ],
    },
    {
      'questionText': 'what\'s your favorite animal?',
      'answers': [
        {'text': 'Cow', 'score': 10},
        {'text': 'Goat', 'score': 10},
        {'text': 'Rat', 'score': 3},
        {'text': 'dog', 'score': 20},
      ],
    },
    {
      'questionText': 'what\'s your favorite food?',
      'answers': [
        {'text': 'Rice', 'score': 10},
        {'text': 'Beans', 'score': 20},
        {'text': 'Indomie', 'score': 20},
        {'text': 'Yam', 'score': 5}
      ],
    },
  ];
  // map contains {}
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score; //to add the old and new score

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have no more question');
    } else {
      print('No more question!');
    }
  }

  @override
  Widget build(BuildContext contex) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Quiz App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ) //colume moved to the quiz widget

              : Result(_totalScore, _resetQuiz) // importing the result widget
          ),
    );
  }
}
