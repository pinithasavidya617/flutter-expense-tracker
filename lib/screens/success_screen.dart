import 'package:flutter/material.dart';
import 'package:money_manage/screens/add_transaction.dart';
import '../configs/size_config.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final isExpense = args['transaction'].isExpense;

    final primaryColor = isExpense ? Colors.red : Colors.green;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            /// ✅ Success Icon
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_rounded,
                size: 70,
                color: primaryColor,
              ),
            ),

            SizedBox(height: 30),

            /// ✅ Title
            Text(
              isExpense ? "Expense Added" : "Income Added",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: 10),

            /// ✅ Subtitle
            Text(
              isExpense
                  ? "Your expense has been recorded successfully."
                  : "Your income has been recorded successfully.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),

            SizedBox(height: 40),

            /// ✅ Back to Dashboard Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text(
                  "Back to Dashboard",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),

            SizedBox(height: 15),

            /// Optional secondary action
            TextButton(
              onPressed: () {
                Navigator.pop(context,
                    MaterialPageRoute(
                        builder: (context) => AddTransaction()));
              },
              child: Text(
                "Add Another",
                style: TextStyle(color: primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}