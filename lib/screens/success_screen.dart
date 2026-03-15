import 'package:flutter/material.dart';

import '../configs/size_config.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      body: Center(
        child: args['transaction'].isExpense?
            Text("Expense added successfully") :
            Text("Income added successfully")

      ),
    );
  }
}
