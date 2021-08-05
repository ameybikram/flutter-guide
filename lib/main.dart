import 'package:flutter/material.dart';

void main() {
  // So here we pass MyApp and we execute this like a function by adding parentheses,
  // that is important,
  // don't forget these parentheses, otherwise you would use it as a type
  // but this does not need a type but a concrete object and you instantiate an object based on a class
  // by adding parentheses.
  // runApp takes our widget class and call build method for us
  runApp(MyApp());
}

//Widget is a special type of object hence we need to create a class and we need classes to create objects
// StatelessWidget Class is a base class of material.dart
// function inside a class is called method and variable inside a class is called property

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    // build method is called by flutter
    // context contains the meta information about the app
    // BuildContext is a special object type that is defined in material.dart
    // Widget just as BuildContext is again a class and every class automatically then also is a type, which is provided by material.dart

    // MaterialApp widget is also provided by material.dart, that's a widget provided by the flutter team which does some base setup to turn your combination  of widgets intoa real app that can be rendered.
    // MaterialApp uses so-called named arguments which means we don't pass in data in order here
    // Material app is a class and yet we can pass data just like we do in function to it with a feature called a constructor
    // @required keyword(not dart feature) means that we have to provide the value of the parameter that is required 
    return MaterialApp(
      home: Text('Hello'), // Text() takes a string as an input
    );
  }
}
