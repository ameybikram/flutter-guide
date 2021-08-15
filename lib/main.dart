import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';
import 'quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // createState returns State Object
    // TODO: implement createState
    return _MyAppState();
  }
}

// State widget cannot be re-built
// First of all, state is a generic type so we should add angled brackets there and in between, we add a pointer
// at our class here,
// Difference between MyAppState and _MyAppState is that the latter cannot be accessed from another file and it's property cannot be accessed or mutated from other files and this class becomes private whereas classes name with no underscore is public and is accessible from any file.
// Class Name/ Properties/ Methods name with underscore
class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 1},
        {'text': 'Elephant', 'score': 9},
        {'text': 'Lion', 'score': 5}
      ],
    },
    {
      'questionText': 'Who\'s your favourite cricketer?',
      'answers': [
        {'text': 'Sachin', 'score': 10},
        {'text': 'Virat', 'score': 9},
        {'text': 'Rohit', 'score': 9},
        {'text': 'Dhoni', 'score': 10}
      ],
    },
  ];
  var _questionIndex = 0; // Called properties
  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      // setState is use to call build method again for the widget where it is called
      // To re render the state when onPressed is called hence to change the state
      if (_questionIndex < _questions.length) {
        _questionIndex++;
      }
    });
    print(_questionIndex);
  }

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, resetQuiz),
      ),
    );
  }
}
