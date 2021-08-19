import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'package:intl/intl.dart';

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
  // This below variable transactions will hold a list of Transaction type
  final List<Transaction> transactions = [
    // In this case, Transaction itself is not a widget. It's a normal class/ object. It's not extending StatelessWidget/ StatefulWidget
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];
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
        body: Column(
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
            Card(
              elevation: 5,
              child: Container(
                // If we need some padding, there is a dedicated Padding() widget - basically a simplified Container()
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                      // Flutter automatically connects the controller with our text fields and these controllers in the end listen to the user input and save the user input
                      controller: titleController,
                      // onChanged: (val) {
                      //   titleInput = val;
                      // },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Amount',
                      ),
                      controller: amountController,
                      // onChanged: (val) {
                      //   amountInput = val;
                      // }, // onChaned is fired with every keystroke
                    ),
                    FlatButton(
                      child: Text('Add Trasaction'),
                      onPressed: () => {print(titleController.text)},
                      textColor: Colors.purple,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${tx.amount}', // String interpolation
                          // tx.amount.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // To make the iem to the left as in case of Column we will use crossAxisAlignment to give position in horizontal direction
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              // color: Colors.purple,
                            ),
                          ),
                          Text(
                            // DateFormat('yyyy/MM/dd').format(tx.date),
                            // DateFormat('yyyy-MM-dd').format(tx.date),
                            DateFormat.yMMMd().format(tx.date),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ));
  }
}
