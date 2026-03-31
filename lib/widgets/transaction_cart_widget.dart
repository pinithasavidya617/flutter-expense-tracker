// import 'package:flutter/material.dart';
// import 'package:money_manage/configs/size_config.dart';
// import 'package:money_manage/data/model/transaction_model.dart';
//
// class TransactionWidget extends StatelessWidget {
//
//   const TransactionWidget({super.key, required this.transaction});
//
//   final TransactionModel transaction;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: SizeConfig.blockHeight * 1.5),
//       padding: EdgeInsets.all(SizeConfig.blockWidth * 3),
//       decoration: BoxDecoration(
//         color: Colors.grey,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 6,
//           )
//         ],
//       ),
//
//       child: Row(
//         children: [
//
//           Container(
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Colors.grey.shade100,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Icon(
//               transaction.isExpense
//                   ? Icons.shopping_bag
//                   : Icons.account_balance_wallet,
//               color: transaction.isExpense ? Colors.red : Colors.green,
//             ),
//           ),
//
//           SizedBox(width: SizeConfig.blockWidth * 3),
//
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 Text(
//                   transaction.title,
//                   style: TextStyle(
//                       fontSize: SizeConfig.blockWidth * 4.5,
//                       fontWeight: FontWeight.bold),
//                 ),
//
//                 SizedBox(height: 2),
//
//                 Text(
//                   transaction.date.toString(),
//                   style: TextStyle(
//                     color: Colors.grey,
//                     fontSize: SizeConfig.blockWidth * 3.5,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           Text(
//             "${transaction.isExpense ? '-' : '+'}\$${transaction.amount.toStringAsFixed(2)}",
//             style: TextStyle(
//               color: transaction.isExpense ? Colors.red : Colors.green,
//               fontSize: SizeConfig.blockWidth * 4,
//               fontWeight: FontWeight.bold,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }