// import 'package:flutter/material.dart';
// import 'package:money_manage/data/model/transaction_model.dart';
// import 'package:money_manage/screens/success_screen.dart';
// import 'package:money_manage/screens/transactions_screen.dart';
//
// import '../configs/size_config.dart';
//
// class AddTransactionDemo extends StatefulWidget {
//   const AddTransactionDemo({super.key});
//
//   @override
//   State<AddTransactionDemo> createState() => _AddTransactionDemoState();
// }
//
// class _AddTransactionDemoState extends State<AddTransactionDemo> {
//   bool isExpense = true;
//   String? selectedCategory = "Shopping";
//
//   final List<DropdownMenuItem<String>> categories = <DropdownMenuItem<String>>[
//     const DropdownMenuItem(value: "", child: Text("Select Category")),
//     const DropdownMenuItem(value: "shopping", child: Text("Shopping")),
//     const DropdownMenuItem(value: "medicine", child: Text("Medicine")),
//   ];
//
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 5),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           Navigator.pop(
//                             context,
//                             MaterialPageRoute(builder: (context) => Transactions()),
//                           );
//                         },
//                         icon: Icon(Icons.arrow_back_ios),
//                       ),
//                       SizedBox(width: SizeConfig.blockWidth * 16),
//                       Text(
//                         "Add Transaction",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: SizeConfig.blockWidth * 5,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: SizeConfig.blockHeight * 2),
//                   Container(
//                     padding: const EdgeInsets.all(4),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(30),
//                       border: Border.all(color: Colors.grey.shade300, width: 2),
//                     ),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: GestureDetector(
//                             onTap: () => setState(() => isExpense = true),
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(vertical: 12),
//                               decoration: BoxDecoration(
//                                 color: isExpense ? Colors.pinkAccent : Colors.transparent,
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   "Expense",
//                                   style: TextStyle(
//                                     color: isExpense ? Colors.white : Colors.black,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: GestureDetector(
//                             onTap: () => setState(() => isExpense = false),
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(vertical: 12),
//                               decoration: BoxDecoration(
//                                 color: !isExpense ? Colors.greenAccent : Colors.transparent,
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   "Income",
//                                   style: TextStyle(
//                                     color: !isExpense ? Colors.white : Colors.black,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: SizeConfig.blockHeight * 3),
//                   Container(
//                     width: double.infinity,
//                     padding: EdgeInsets.symmetric(vertical: 20),
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade100,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Center(
//                       child: Text(
//                         "\$0.00",
//                         style: TextStyle(
//                           fontSize: SizeConfig.blockWidth * 8,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey.shade700,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: SizeConfig.blockHeight * 3),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "Category",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: SizeConfig.blockWidth * 5,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: SizeConfig.blockHeight * 2),
//                   Form(
//                     key: _formKey,
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     child: DropdownButtonFormField<String>(
//                       decoration: InputDecoration(
//                         border: UnderlineInputBorder(),
//                         prefixIcon: Icon(Icons.list),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Category is required";
//                         }
//                         return null;
//                       },
//                       items: categories,
//                       onChanged: (value) {
//                         setState(() {
//                           selectedCategory = value;
//                         });
//                       },
//                     ),
//                   ),
//                   SizedBox(height: SizeConfig.blockHeight * 3),
//                   TextField(
//                     decoration: InputDecoration(
//                       hintText: "Note (optional)",
//                       border: UnderlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(height: SizeConfig.blockHeight * 25),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamedAndRemoveUntil(
//                         context,
//                         '/transaction-success',
//                             (route) => route.settings.name == '/home',
//                         arguments: {
//                           "transaction": TransactionModel(
//                             iconName: 'cart',
//                             title: 'Grocery',
//                             date: DateTime(2026, 02, 22),
//                             amount: 45.33,
//                             isExpense: true,
//                           )
//                         },
//                       );
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       padding: EdgeInsets.symmetric(vertical: 16),
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [Colors.deepPurple, Colors.pinkAccent],
//                         ),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Center(
//                         child: Text(
//                           isExpense ? "Add Expense" : "Add Income",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: SizeConfig.blockWidth * 4,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: SizeConfig.blockHeight * 4),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }