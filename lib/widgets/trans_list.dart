import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransationList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delTx;

  TransationList(this.transactions, this.delTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  "No Transactions Yet!",
                  style: TextStyle(fontSize: 18, color: Colors.black45),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Opacity(
                      opacity: 0.3,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    )),
              ],
            );
          })
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      delTx: delTx,
                    ))
                .toList(),
          );
  }
}
