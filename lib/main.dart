import 'package:flutter/material.dart';
import './widgets/chart.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/new_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          // Remember that floating action button is a default button or a default widget provided by Flutter and internally, it's simply configured to use the accent color if available and fallback to the primary color if it's not available
          fontFamily: 'Quicksand',
          accentColor: Colors.amber,
          textTheme: ThemeData.light().textTheme.copyWith(
              // To apply style in just title bar
              title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  // To apply style in just title bar
                  title: TextStyle(fontFamily: 'OpenSans', fontSize: 20)))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  // TextEditingController() is a class provided by flutter
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions
        .where(
          (tx) => tx.date.isAfter(
            DateTime.now().subtract(
              Duration(days: 7),
            ),
          ),
        )
        .toList();
  }

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _startAddNewTransaction(BuildContext ctx) {
    // builder is a function which returns the widget that should inside be showModalBottomSheet
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Personal Expenses',
              style: TextStyle(fontFamily: 'Open Sans')),
          actions: [
            // IconButton renders the button which ony holds the icon
            IconButton(
                onPressed: () => _startAddNewTransaction(context),
                icon: Icon(Icons.add))
          ],
        ),
        // Columns are there to take two or more widget and position them above each other now matter how much vertical space is there and items/widgets next to each other means Row. styling in Flutter works entirely through the arguments you pass to your widgets. and if a certain widget doesn't take a certain argument, if you can't give a column a background color for example, indeed you can't, then you always have to use another widget and wrap the widget which you want to style with it.
        // We have wrapped column with SingleChildScrollView which enables the scrolling functionality in the column Here's one important note, you have to add the single child scroll view on this level here so as the body element itself, it wouldn't work if you add single child scroll view only around user transactions or only inside of the transaction list
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // It starts from the end
            children: [
              Chart(_recentTransactions),
              TransactionList(_userTransactions),
            ],
          ),
        ),
        // We can also change the location of floatingActionButton using floatingActionButtonLocation
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // We use floatingActionButton to add the button
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ));
  }
}
