import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          children: [
            // Card by defaut assumes the size of its child unless unless you have a parent or a card like container, which has its own clearly defined width. This also means that column doesn't seem to be such a parent and indeed column is a widget which only takes as much width as its children need. So if we want to change the size of that card here, then we need to change the size of child. Now text on the other hand is a widget which by default only takes as much space as this text needs and if you want to change the size of text, you need to change the size of its parent. So what can we do here since this card depends on the child and this text depends on the parent? We have a dependency which is kind of hard to break, right, There are two ways of breaking that one is that we wrap that text with a widget where we can set a size and we can do it with the refactoring shortcut which you can find in the key bindings in case you forgot it and there we can wrap the text with a container because container is the most universal styling positioning sizing widget you have. With a container, you can control almost anything when it comes to how something is sized or how something is aligned and styled, at least if we talk about things like background colors and so on and therefore, once I wrap the text with a container, we can use the fact that on the container we can set a width and we could set this to 100 and this means the container will now have the width of 100 device pixels which is a unit that always gives us the same size even on differently sized phones or devices.
            Card(
              child: Container(
                  color: Colors.blue, width: 100, child: Text('Chart!')),
            ),
            Card(
              child: Text('List of TX'),
            )
          ],
        ));
  }
}
