import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    // return Container(
    // We need to give height otherwise ListView takes infinite height as its scrollable
    // height: 450,
    // height: MediaQuery.of(context).size.height * 0.6,
    // child: SingleChildScrollView(
    // child: Column(
    // Since Column and Row is not scrollable by default and to make it scrollable we use SingleChildScrollView but we can also use ListView. ListView is a widget provided by Flutter which is the end by default a column/row with a single child scroll view but you can also set a scroll direction in case you need a row instead of a column, a scrollable row. We can also use ListView.builder() as it only renders the data in the list that is visible hence good for performance and for long lists consider using ListView.builder()
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No Transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20, // Distance between Text and Container
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            // itemBuilder() will be called the number of times of itemCount and we wil return the widget
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                          child: Text('\$${transactions[index].amount}')),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle:
                      Text(DateFormat.yMMMd().format(transactions[index].date)),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? FlatButton.icon(
                          icon: Icon(Icons.delete),
                          label: Text('Delete'),
                          textColor: Theme.of(context).errorColor,
                          onPressed: () => deleteTx(transactions[index].id),
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () => deleteTx(transactions[index].id),
                        ),
                ),
              );
            },
            // Now what you can't provide to the builder constructor is your children thing here, instead what you need to provide is the item count argument and that defines how many items should be built. In our case here, that would be the length of our transactions list,
            itemCount: transactions.length,
          );
    // ),
    // );
  }
}
