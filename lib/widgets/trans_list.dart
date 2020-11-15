import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransationList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delTx;

  TransationList(this.transactions, this.delTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transactions Yet",
                  style: TextStyle(fontSize: 18, color: Colors.black45),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              // ignore: deprecated_member_use
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                  elevation: 3,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FittedBox(
                          child: Text(
                            '₹' + transactions[index].amt.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    title: Text(transactions[index].title,
                        style:
                            // TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                            // ignore: deprecated_member_use
                            Theme.of(context).textTheme.title),
                    subtitle: Text(
                      DateFormat.yMMMEd().format(transactions[index].date),
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete_forever_rounded),
                      color: Colors.grey,
                      onPressed: () {
                        delTx(transactions[index].id);
                      },
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}