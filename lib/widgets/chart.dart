import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

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

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amt': totalTxDay
      };
    }).reversed.toList();
  }

  double get totalSpent {
    return groupedTx.fold(0.0, (sum, item) {
      return sum + item['amt'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTx.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  data['day'],
                  data['amt'],
                  totalSpent == 0.0 ? 0.0 : (data['amt'] as num) / totalSpent),
            );
          }).toList(),
        ),
      ),
    );
  }
}
