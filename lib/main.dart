import 'package:flutter/material.dart';
import 'package:flutter_app/result.dart';
import './quiz.dart';
import './answer.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'black', 'score': 5},
        {'text': 'white', 'score': 6},
        {'text': 'blue', 'score': 3},
        {'text': 'green', 'score': 4},
      ],
    },
    {
      'questionText': 'Which\'s your animal?',
      'answers': [
        {'text': 'tiger', 'score': 7},
        {'text': 'Lion', 'score': 4},
        {'text': 'Dog', 'score': 3},
        {'text': 'Cat', 'score': 4},
      ],
    },
    {
      'questionText': 'What\'s your favourite Food?',
      'answers': [
        {'text': 'Dhosa', 'score': 3},
        {'text': 'Chapathi', 'score': 8},
        {'text': 'Idli', 'score': 6},
        {'text': 'Maggie', 'score': 4},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex < _questions.length) {
      print('we have more questions');
    }
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sample Quiz App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
