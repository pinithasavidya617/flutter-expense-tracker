import 'package:flutter/material.dart';
import 'package:money_manage/screens/success_screen.dart';
import 'package:money_manage/screens/transactions_screen.dart';

import '../configs/size_config.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  bool isExpense = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                            MaterialPageRoute(builder: (context) => Transactions()));
                          }, icon: Icon(Icons.arrow_back_ios)),
                      SizedBox(
                        width: SizeConfig.blockWidth * 16,
                      ),
                      Text(
                        "Add Transaction",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.blockWidth * 5),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 2),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 2,
                      )
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => isExpense = true),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: isExpense
                                    ? Colors.pinkAccent
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  "Expense",
                                  style: TextStyle(
                                    color:
                                        isExpense ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => isExpense = false),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: !isExpense
                                    ? Colors.greenAccent
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  "Income",
                                  style: TextStyle(
                                    color: !isExpense
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 3),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "\$0.00",
                        style: TextStyle(
                          fontSize: SizeConfig.blockWidth * 8,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),

                  Column(
                    children: [ElevatedButton(onPressed: () {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) => SuccessScreen()),
                          (route) {
                            return route.settings.name == null &&
                            route is MaterialPageRoute &&
                            route.builder(context) is Transactions;
                            // route.isFirst
                          }
                      );
                    },
                        child: Text("Add Expense"))],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
