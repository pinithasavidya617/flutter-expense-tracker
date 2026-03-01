import 'package:flutter/material.dart';

import '../configs/size_config.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
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

                    Text("Add Transaction",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockWidth * 5
                      ),),
                  ],
                                ),
                )],
            ),),
    );
  }
}
