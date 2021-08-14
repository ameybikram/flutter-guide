import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String
      questionText; // final will tell that it cannot be changed after once it is reassigned in the constructor. That is constructor can change its value.

  Question(
      this.questionText); //Constructor which is contains a positional argument and whatever value here string type is passed to this class is set to the class variable just like as in the below example
// class Person{
//   String name;
//   int age;

//   Person({this.name='Anil', this.age=30});
//   Person.veryOld(this.name) {
//      age = 30;
// }
// }

// void main() {
//   var p1 = Person(name: 'Max');
//   var p2 = Person(age: 31, name: 'Manu');
//   var p3 = Person.veryOld('Max);
//   print(p1.name);
//   print(p2.name);
// }
//Constructor is called when an object based on the class is created

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10), // Example :Person.veryOld() in the above example
//       EdgeInsets.all, we can assign a certain value as a margin in all directions around the container. With only, we could target one specific direction, for example only to the top or only to the bottom. So here, I'll actually use all and now to all, you simply pass a double value, so here we could add 10 and now this will take 10 device pixels of margin around the container, which is why we now see a little bit more spacing around our title.
      child: Text(
        //By default Text widget wrap the text as much space as it need hence to align the text in center we have wrapped Text widget to Container widget and use <width: double.infinity,> because double.infinity, .infinity gives you basically a width that ensures that the container takes as much size, as much width as it can get,so by default the full width of the device and now we see this is centered, why? Because the container takes the full width of the screen now and the text now automatically takes the full width of the container. So now the text does not use its text as a measurement for how big it should be but the surrounding widget and that's just the default behavior of Flutter
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
