import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // const NewTransaction({ Key? key }) : super(key: key);
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTx;

  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addTx(enteredTitle, enteredAmount);
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
