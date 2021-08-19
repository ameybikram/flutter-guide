import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // const NewTransaction({ Key? key }) : super(key: key);
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTx;

  NewTransaction(this.addTx);

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
              onPressed: () {
                addTx(
                    titleController.text, 
                    double.parse(amountController.text));
              },
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
