import 'package:flutter/material.dart';
import './widgets/user_transaction.dart';

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
  // String titleInput;
  // String amountInput;
  // TextEditingController() is a class provided by flutter
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        // Columns are there to take two or more widget and position them above each other now matter how much vertical space is there and items/widgets next to each other means Row. styling in Flutter works entirely through the arguments you pass to your widgets. and if a certain widget doesn't take a certain argument, if you can't give a column a background color for example, indeed you can't, then you always have to use another widget and wrap the widget which you want to style with it.
        // We have wrapped column with SingleChildScrollView which enables the scrolling functionality in the column Here's one important note, you have to add the single child scroll view on this level here so as the body element itself, it wouldn't work if you add single child scroll view only around user transactions or only inside of the transaction list
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // It starts from the end
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Text('Chart!'),
                  elevation: 5,
                ),
              ),
              UserTransactions(),
            ],
          ),
        ));
  }
}
