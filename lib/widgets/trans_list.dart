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
                  elevation: 3,
                  child: Row(
                    children: [
                      Container(
                        child: CircleAvatar(radius: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: FittedBox(
                              child: Text(
                                '₹' + transactions[index].amt.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 8),
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
