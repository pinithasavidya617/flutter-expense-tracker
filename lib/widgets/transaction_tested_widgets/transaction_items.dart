import 'package:flutter/material.dart';
import 'package:money_manage/configs/size_config.dart';

class TransactionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;
  final String amount;
  final bool isExpense;

  const TransactionItem({
    super.key,
    required this.icon,
    required this.title,
    required this.date,
    required this.amount,
    required this.isExpense,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockWidth * 5,
              vertical: SizeConfig.blockHeight * 1
            ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Icon(icon, size: 24,),
            ),
            SizedBox(width: SizeConfig.blockWidth * 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: SizeConfig.blockWidth * 4,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(width: SizeConfig.blockHeight * 1.5),
                Text(date,
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: SizeConfig.blockWidth * 3,
                      fontWeight: FontWeight.bold
                  ),),
              ],
            ),
            Spacer(),
            Text(amount,
              style: TextStyle(
                  fontSize: SizeConfig.blockWidth * 4,
                  fontWeight: FontWeight.bold,
                color: isExpense ? Colors.red : Colors.green
              ),),
          ],
        ),),
        Divider(
          thickness: 1,
        )
      ],
    );
  }
}
