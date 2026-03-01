import 'package:flutter/material.dart';

import '../configs/size_config.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 5),
              child: Row(
                children: [
                  IconButton(onPressed: () {} ,
                      icon: Icon(Icons.arrow_back_ios)),

                  SizedBox(width: SizeConfig.blockWidth * 16,),

                  Text("Transactions",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.blockWidth * 5
                    ),),
                ],
              ),
            )],
        ),),
    );  }
}
