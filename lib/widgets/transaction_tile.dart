import 'package:flutter/material.dart';
import 'package:money_manage/data/model/transaction_model.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({super.key, required this.transaction});

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor:
            transaction.transactionType == "income" ? Colors.green : Colors.red,
        child: Icon(
          transaction.transactionType == "income"
              ? Icons.shopping_bag
              : Icons.account_balance_wallet,
          color: Colors.white,
        ),
      ),
      title: Text(
        transaction.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(transaction.category),
      trailing: Text(
        "\$${transaction.amount}",
        style: TextStyle(
          color: transaction.transactionType == "income"
              ? Colors.green
              : Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
