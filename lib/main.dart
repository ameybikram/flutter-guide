import 'package:flutter/material.dart';

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
  var _questionIndex = 0; // Called properties
  void _answerQuestion() {
    setState(() {
      // setState is use to call build method again for the widget where it is called
      // To re render the state when onPressed is called hence to change the state
      if (_questionIndex < 1) {
        _questionIndex++;
      }
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favourite color?',
      'What\'s your favourite animal?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Text(
              // questions.elementAt(0),
              questions[_questionIndex],
            ),
            RaisedButton(
                child: Text('Answer 1'),
                onPressed: _answerQuestion), // onPressed takes a function
            RaisedButton(
                child: Text('Answer 2'),
                onPressed:
                    _answerQuestion), // onPressed takes a function name and it should be without parenthesis
            RaisedButton(child: Text('Answer 3'), onPressed: _answerQuestion),
          ],
        ),
      ),
    );
  }
}
