import 'package:flutter/material.dart';
import 'package:money_manage/configs/size_config.dart';
import 'package:money_manage/data/model/transaction_model.dart';

class TransactionWidget extends StatelessWidget {


  const TransactionWidget({super.key, required this.transaction });

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text("data"),
      title: Text(transaction.title,
          style: TextStyle(
          fontSize: SizeConfig.blockWidth * 5,
          fontWeight: FontWeight.bold
      )),
      subtitle: Text(transaction.date.toString(),
          style: TextStyle(
              fontSize: SizeConfig.blockWidth * 4,
          )),
      trailing: Text("${transaction.isExpense ? '-' : '+'}\$${transaction.amount.toStringAsFixed(2)}",
        style: TextStyle(
          color: transaction.isExpense ? Colors.red : Colors.green,
          fontSize: SizeConfig.blockWidth * 4,
          fontWeight: FontWeight.bold
        ),),
    );
  }
}