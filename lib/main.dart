import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /* Keep in mind that Flutter controls the entire UI, all the pixels on the screen are controlled by your Flutter app in the end, by the Flutter framework. It does not take an existing mobile app and just mix in some widgets or some components, it controls the entire app instead and therefore you also have to give clear instructions about every detail,what should be the background color, should there be an appBar? And to do that, there is a little helper widget which you can use and I'll replace my text widget here with it and that's scaffold. Now scaffold is yet another widget which is baked into material.dart. So it will give you a basic design and structure and color scheme or coloring for giving you a UI that looks more like a regular mobile app page. Scaffold also has a couple of named arguments*/
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Text('This is my default text'),
      ),
    );
  }
}
