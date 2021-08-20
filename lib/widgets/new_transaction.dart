import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  // const NewTransaction({ Key? key }) : super(key: key);
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

// A widget being re-evaluated means that any internally stored data is reset is lost. That's why we lose our user input in a state less widget, because whenever it is re-evaluated by flutter, for whatever reason, we lose to state to this kirtley stored in there, we lose our data that's stored in there. And for a state full widget, that's different. We have that separate state object, that state class. And whilst the which it does are also would be re-evaluated by flutter, the state kind of his detached from this and data stored in that state will not be lost if the widget that belongs to it is reevaluatedby flutter. So we have a separation of data and the UI. You could say and therefore we can persist data. And it's not lost when something changes on the screen or when a flutter decides that it wants to reevaluate that widget. That's where our data is then persistent. And that's why we need a state full widget here.
class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    // In case of state class, it gives us the widget class so with the widget dot we can access the properties and methods of your widget stateful class inside of your state class
    widget.addTx(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        // If we need some padding, there is a dedicated Padding() widget - basically a simplified Container()
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              // TextField() is used for user input and Text() is used to output text
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              // Flutter automatically connects the controller with our text fields and these controllers in the end listen to the user input and save the user input
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
              // To open numbers in keyboard so that users can only add numbers in the amount field
              keyboardType: TextInputType.number,
              // onSubmitted is used for submit the data when user clicks on tick icon of keyboard
              onSubmitted: (_) =>
                  submitData(), // Parameter _ is a convention to show that we will not use the paramter
            ),
            FlatButton(
              child: Text('Add Trasaction'),
              onPressed: submitData,
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
