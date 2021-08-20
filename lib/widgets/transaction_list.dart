import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          300, // We need to give height otherwise ListView takes infinite height as its scrollable
      // child: SingleChildScrollView(
      // child: Column(
      // Since Column and Row is not scrollable by default and to make it scrollable we use SingleChildScrollView but we can also use ListView. ListView is a widget provided by Flutter which is the end by default a column/row with a single child scroll view but you can also set a scroll direction in case you need a row instead of a column, a scrollable row. We can also use ListView.builder() as it only renders the data in the list that is visible hence good for performance and for long lists consider using ListView.builder()
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20, // Distance between Text and Container
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              // itemBuilder() will be called the number of times of itemCount and we wil return the widget
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 2),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}', // String interpolation and toStringAsFixed() will round of the number with the given decimal places
                          // tx.amount.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // To make the iem to the left as in case of Column we will use crossAxisAlignment to give position in horizontal direction
                        children: [
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            // DateFormat('yyyy/MM/dd').format(tx.date),
                            // DateFormat('yyyy-MM-dd').format(tx.date),
                            DateFormat.yMMMd().format(transactions[index].date),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              // Now what you can't provide to the builder constructor is your children thing here, instead what you need to provide is the item count argument and that defines how many items should be built. In our case here, that would be the length of our transactions list,
              itemCount: transactions.length,
            ),
      // ),
    );
  }
}
