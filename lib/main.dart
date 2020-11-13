import 'package:flutter/material.dart';

import 'package:ExpensY_APP/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 'exp1',
      title: 'T-shirt',
      amt: 150.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'exp2',
      title: 'Shoes',
      amt: 650.00,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpensY'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text('bar chart'),
              color: Colors.blue,
              elevation: 5,
            ),
          ),
          Column(
            children: transactions.map((trans) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        trans.amt.toString(),
                      ),
                    ),
                    Column(
                      children: [
                        Text(trans.title),
                        Text(trans.date.toString())
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
