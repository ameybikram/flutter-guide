import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
// So we learned about stateful widgets, the other type of widget you can create in Flutter which differs
// from the stateless widget in that it can manage internal data.
// Well you could do that in a stateless widget too, you can do that in any Dart class after all
// but in a stateful widget if you manage that internal data actually in a state object then which is connected
// to the stateful widget, you can update this in a way that it's picked up by Flutter and that UI also
// updates.
  @override
  State<StatefulWidget> createState() {
    // createState returns State Object
    // TODO: implement createState
    return MyAppState();
  }
}
// State widget cannot be re-built
// First of all, state is a generic type so we should add angled brackets there and in between, we add a pointer
// at our class here,
class MyAppState extends State<MyApp> {
  var questionIndex = 0;
  void answerQuestion() {
    setState(() { // setState is use to call build method again for the widget where it is called
      // To re render the state when onPressed is called hence to change the state
      if (questionIndex < 1) {
        questionIndex++;
      }
    });
    print(questionIndex);
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
              questions[questionIndex],
            ),
            RaisedButton(
                child: Text('Answer 1'),
                onPressed: answerQuestion), // onPressed takes a function
            RaisedButton(
                child: Text('Answer 2'),
                onPressed:
                    answerQuestion), // onPressed takes a function name and it should be without parenthesis
            RaisedButton(child: Text('Answer 3'), onPressed: answerQuestion),
          ],
        ),
      ),
    );
  }
}
