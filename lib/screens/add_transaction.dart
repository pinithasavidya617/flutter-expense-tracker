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
  String? selectedCategory = "Shopping";

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
                                MaterialPageRoute(
                                    builder: (context) => Transactions()));
                          },
                          icon: Icon(Icons.arrow_back_ios)),
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
                        )),
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
                  SizedBox(height: SizeConfig.blockHeight * 3),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Category",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.blockWidth * 5,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 2),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedCategory,
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: ["Shopping", "Food", "Transport", "Bills"]
                            .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Row(
                                    children: [
                                      Icon(Icons.shopping_bag,
                                          color: Colors.redAccent),
                                      SizedBox(width: 10),
                                      Text(
                                        item,
                                        style: TextStyle(
                                            fontSize:
                                                SizeConfig.blockWidth * 4),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 3),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Note (optional)",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 25),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuccessScreen()),
                        (route) => false,
                        // route.isFirst
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.deepPurple,
                            Colors.pinkAccent,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          isExpense ? "Add Expense" : "Add Income",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.blockWidth * 4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 4),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
