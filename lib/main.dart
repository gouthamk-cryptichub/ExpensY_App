import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'; ###

import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/trans_list.dart';
import './widgets/chart.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized(); ###
  // SystemChrome.setPreferredOrientations( ###
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]); ###
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpensY',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepPurple,
        fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle( // ignore: deprecated_member_use
                  // ignore: deprecated_member_use
                  fontFamily: 'QuickSand',
                  fontSize: 18,
                  fontWeight: FontWeight.bold), // ignore: deprecated_member_use
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                // ignore: deprecated_member_use
                title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amtInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 'exp1',
    //   title: 'T-shirt',
    //   amt: 150,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 'exp2',
    //   title: 'Shoes',
    //   amt: 650,
    //   date: DateTime.now(),
    // )
  ];

  bool _switchVal = false;

  List<Transaction> get _recentTxx {
    return _userTransactions.where((elementTx) {
      return elementTx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String txTitle, num txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amt: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _openAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(_addNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void deleteTx(String id) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {

    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    final _appbarWig = AppBar(
      title: Text('ExpensY'),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _openAddNewTransaction(context),
        ),
      ],
    );

    final listWig = Container(
      height: (MediaQuery.of(context).size.height -
          _appbarWig.preferredSize.height -
          MediaQuery.of(context).padding.top) *
          0.67,
      child: TransationList(_userTransactions, deleteTx),
    );
    return Scaffold(
      appBar: _appbarWig,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandscape) Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text('Show Chart'),
                Switch(value: _switchVal, onChanged: (val) {
                  setState(() {
                    _switchVal = val;
                  });

                }),
              ],
            ),
            if (!isLandscape) Container(
              height: (MediaQuery.of(context).size.height -
                  _appbarWig.preferredSize.height -
                  MediaQuery.of(context).padding.top) *
                  0.33,
              child: Chart(_recentTxx),
            ),
            if (!isLandscape) listWig,
            if (isLandscape) _switchVal
            ? Container(
              height: (MediaQuery.of(context).size.height -
                      _appbarWig.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.67,
              child: Chart(_recentTxx),
            )
            : listWig
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openAddNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
