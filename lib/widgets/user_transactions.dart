import 'package:flutter/material.dart';

import './trans_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

  final List<Transaction> _userTransactions = [
    Transaction(
      id: 'exp1',
      title: 'T-shirt',
      amt: 150,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'exp2',
      title: 'Shoes',
      amt: 650,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String txTitle,num txAmount) {
    final newTx = Transaction(id: DateTime.now().toString(), title: txTitle, amt: txAmount, date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransationList(_userTransactions),
      ],
    );
  }
}
