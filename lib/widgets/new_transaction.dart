import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titlecon = TextEditingController();

  final amtcon = TextEditingController();

  void submitData() {
    final actualTitle = titlecon.text;
    final actualAmount = num.parse(amtcon.text);

    if (actualTitle.isEmpty || actualAmount <= 0) {
      return;
    }
    widget.addTx(actualTitle, actualAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // onChanged: (val) => titleInput = val,
              controller: titlecon,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val) => amtInput = val,
              controller: amtcon,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              onPressed: () {
                // print(titleInput);
                // print(amtInput);
                // print(titlecon.text);
                // print(amtcon.text);
                submitData();
              },
              child: Text(
                'ADD',
                style: TextStyle(color: Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
