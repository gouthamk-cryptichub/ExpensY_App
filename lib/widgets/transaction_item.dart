import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.delTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function delTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    super.initState();
    final availableColors = [
      Colors.amber[200],
      Colors.amber[300],
      Colors.deepOrange[200],
      Colors.deepOrange[300],
      Colors.lightBlue[200],
      Colors.lightBlue[300],
      Colors.green[200],
      Colors.green[300],
    ];

    _bgColor = availableColors[Random().nextInt(8)];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      elevation: 3,
      child: ListTile(
        tileColor: _bgColor,
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30,
          child: CircleAvatar(
            backgroundColor: _bgColor,
            radius: 25,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: FittedBox(
                child: Text(
                  '₹' + widget.transaction.amt.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        title: Text(widget.transaction.title,
            style:
                // TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                // ignore: deprecated_member_use
                Theme.of(context).textTheme.title),
        subtitle: Text(
          DateFormat.yMMMEd().format(widget.transaction.date),
          style: TextStyle(color: Colors.white),
        ),
        trailing: MediaQuery.of(context).orientation == Orientation.landscape
            ? FlatButton.icon(
                onPressed: () {
                  widget.delTx(widget.transaction.id);
                },
                icon: const Icon(Icons.delete_forever_rounded),
                label: const Text('DELETE'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: Icon(Icons.delete_forever_rounded),
                color: Colors.white,
                onPressed: () {
                  widget.delTx(widget.transaction.id);
                },
              ),
      ),
    );
  }
}
