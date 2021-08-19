import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, // We need to give height otherwise ListView takes infinite height as its scrollable
      // child: SingleChildScrollView(
      // child: Column(
      // Since Column and Row is not scrollable by default and to make it scrollable we use SingleChildScrollView but we can also use ListView. ListView is a widget provided by Flutter which is the end by default a column/row with a single child scroll view but you can also set a scroll direction in case you need a row instead of a column, a scrollable row. We can also use ListView.builder() as it only renders the data in the list that is visible hence good for performance
      child: ListView(
        children: transactions.map((tx) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
      ),
      // ),
    );
  }
}
