import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // const Question({ Key? key }) : super(key: key);
//   This class is marked as immutable,
// that happens inside of the stateless widget in the end
// and yet we have an instance field which in the end is just a property which is not final, which means it
// could be changed,
// you could change that string from inside that class and therefore, it's a good convention and recommended
// that you add final in front of this property definition here.
// This tells Dart that this value will never change after its initialization here in the constructor.
// So this change doesn't count,
  final String
      questionText; // final will tell that it cannot be changed after once it is reassigned in the constructor. That is constructor can change its value.

  Question(
      this.questionText); //Constructor which is contains a placed parameter and whatever value here string type is passed to this class is set to the class variable just like as in the below example
// class Person{
//   String name;
//   int age;

//   Person({this.name='Anil', this.age=30});
// }

// void main() {
//   var p1 = Person(name: 'Max');
//   var p2 = Person(age: 31, name: 'Manu');
//   print(p1.name);
//   print(p2.name);
// }
//Constructor is called when an object based on the class is created

  @override
  Widget build(BuildContext context) {
    return Text(questionText);
  }
}
