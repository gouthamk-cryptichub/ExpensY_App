import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransationList extends StatelessWidget {
  final List<Transaction> transactions;

  TransationList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 375,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transactions Yet",
                  style:TextStyle(fontSize: 18, color: Colors.black45 ),
                ),
                SizedBox(height: 30,),
                Container(height: 200,child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,)),
              ],
            )
          : ListView.builder(
              // ignore: deprecated_member_use
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          '₹' + transactions[index].amt.toStringAsPrecision(4),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColorDark,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        width: 81,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(transactions[index].title,
                              style:
                                  // TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                                  Theme.of(context)
                                      .textTheme
                                      .title // ignore: deprecated_member_use
                              ),
                          Text(
                            DateFormat.yMMMEd()
                                .format(transactions[index].date),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
