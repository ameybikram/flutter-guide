import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Text(
            'This is my default text'), // body widget which is the body of the screen takes only one widget at a time and what if we want to add more widgets like buttons and so on.
        /* For this, it's important to understand that we have different types of widgets in Flutter. We have the visible widgets which are related to user input and to outputting data, things like a button or a text or a card and we have only seen the text from all these examples here thus far but there are more widgets like the RaisedButton which renders a button and other widgets and we'll see all of those throughout the course. Now these are the widgets which we see, we see a button, we see the text right, that is what we see and that is of course crucial for any application but equally crucial are invisible widgets that help us with layout and with controlling how our widget tree behaves and how it looks like and there we got things like row, column, ListView and so on. These are also widgets that ship with Flutter which we don't have to build ourselves, which we don't see themselves but which help us with structuring our content. So these widgets give our app structure and control how visible widgets are drawn onto the screen and therefore of course, they're super important. There also is a very important widget which also ships with Flutter, the container widget which kind of belongs into both categories as you will learn once we use it because it by default is invisible but you can also give it some styling so that you can see it */
      ),
    );
  }
}
