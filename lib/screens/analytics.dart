import 'package:flutter/material.dart';
import '../configs/size_config.dart';

class Analytics extends StatelessWidget {
  const Analytics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text("Analytics"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(SizeConfig.blockWidth * 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                Expanded(child: _summaryCard("Income", "Rs. 45,000", Colors.green)),
                SizedBox(width: 10),
                Expanded(child: _summaryCard("Expense", "Rs. 28,000", Colors.red)),
              ],
            ),

            SizedBox(height: 10),

            _summaryCard("Balance", "Rs. 17,000", Colors.blue),

            SizedBox(height: 25),

            Text(
              "Spending Overview",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 15),

            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text("Chart goes here"),
              ),
            ),

            SizedBox(height: 25),

            Text(
              "Top Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            _categoryItem("Food", "Rs. 12,000", 0.5, Colors.orange),
            _categoryItem("Transport", "Rs. 8,000", 0.3, Colors.blue),
            _categoryItem("Shopping", "Rs. 5,000", 0.2, Colors.purple),

          ],
        ),
      ),
    );
  }

  Widget _summaryCard(String title, String amount, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: color, fontSize: 14)),
          SizedBox(height: 5),
          Text(
            amount,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryItem(String title, String amount, double progress, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
              Text(amount, style: TextStyle(color: Colors.grey[700])),
            ],
          ),

          SizedBox(height: 8),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              color: color,
              backgroundColor: color.withOpacity(0.2),
              minHeight: 6,
            ),
          )
        ],
      ),
    );
  }
}