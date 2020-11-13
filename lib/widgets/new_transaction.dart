import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final titlecon = TextEditingController();
  final amtcon = TextEditingController();

  final Function addTx;

  NewTransaction(this.addTx);

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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val) => amtInput = val,
              controller: amtcon,
            ),
            FlatButton(
              onPressed: () {
                // print(titleInput);
                // print(amtInput);
                // print(titlecon.text);
                // print(amtcon.text);
                addTx(titlecon.text, num.parse(amtcon.text));
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
