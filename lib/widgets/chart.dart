import 'package:ExpensY_APP/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTx;

  Chart(this.recentTx);

  List<Map<String, Object>> get groupedTx {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      num totalTxDay = 0;
      for (var i = 0; i < recentTx.length; i++) {
        if (recentTx[i].date.day == weekDay.day &&
            recentTx[i].date.month == weekDay.month &&
            recentTx[i].date.year == weekDay.year) {
          totalTxDay += recentTx[i].amt;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(totalTxDay);
      return {'day': DateFormat.E().format(weekDay), 'amt': totalTxDay};
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTx);
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTx.map((data) {
          return Text('${data['day']}: ${data['amt']}');
        }).toList(),
      ),
    );
  }
}
