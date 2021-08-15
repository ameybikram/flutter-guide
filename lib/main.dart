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
      'answers': ['Black', 'Red', 'Green', 'White'],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
    },
    {
      'questionText': 'Who\'s your favourite cricketer?',
      'answers': ['Sachin', 'Virat', 'Rohit', 'Dhoni'],
    },
  ];
  var _questionIndex = 0; // Called properties
  void _answerQuestion() {
    setState(() {
      // setState is use to call build method again for the widget where it is called
      // To re render the state when onPressed is called hence to change the state
      if (_questionIndex < _questions.length) {
        _questionIndex++;
      }
    });
    print(_questionIndex);
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
            : Result(),
      ),
    );
  }
}
