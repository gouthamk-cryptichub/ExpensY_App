import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final num spendAmt;
  final num spendPercentageOfTotal;

  ChartBar(this.label, this.spendAmt, this.spendPercentageOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        SizedBox(
          height: 2,
        ),
        Container(
          height: 80,
          width: 10,
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.1),
                  color: Color.fromRGBO(220, 200, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendPercentageOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        FittedBox(
          child: Text('₹$spendAmt'),
        ),
      ],
    );
  }
}
