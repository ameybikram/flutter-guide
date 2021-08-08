import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /*
  We can add a new function outside of the class, that's a bad idea. Your object, so your classes, should always work standalone, so everything that belongs to a widget should go into the same class, all the data a widget uses and so on should belong into the same class so that
the widget is a standalone unit. So we can add a function here into our class,
you can do that because you can add functions to classes, they are then called methods but it's a normal
function.
   */
  var questionIndex = 0;  // We are declaring variable outside the build method because the build method is called multiple times which will reinitialize the variable. Hence we make a class scope variable.
  void answerQuestion() {
    questionIndex++;
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
        //   body: Text(
        //       'This is my default text'), // body widget which is the body of the screen takes only one widget at a time and what if we want to add more widgets like buttons and so on we should use invisible, a layout widgets like Column or row widget.
        body: Column(
          // render widget in a column. If we wanted items next to each other, we would have used a Row() widget. Coloumn has children named widget which actually takes a list of widgets.
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
            // RaisedButton(
            //     child: Text('Answer 4'),
            //     onPressed: () => print('Answer 4 chosen')),
            // RaisedButton(
            //     child: Text('Answer 5'),
            //     onPressed: () {
            //       // ...
            //       print('Answer 5 chosen');
            //     }),
            /* By adding parentheses, this gets executed as soon as Dart encounters this, not when the user presses the button but when Dart goes over that code to set up the RaisedButton. So it executes answerQuestion and now it expects to get back the value which should be passed to the RaisedButton as a value for onPressed but onPressed wants a function, answerQuestion on the
              other hand doesn't return anything because this is a function that doesn't return anything and since we now pass the returned value to onPressed, we return nothing to onPressed but onPressed wants a
              function. So we're not passing this function here to onPressed but the return value of this function
              because by adding parentheses, this gets executed when Dart tries to build that button. Of course, this is not what we want. We want to execute
              answerQuestion when the user presses the button, that's why we want to pass a pointer at answerQuestion to onPressed.*/
          ],
        ),
      ),
    );
  }
}
