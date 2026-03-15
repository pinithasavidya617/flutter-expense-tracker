import 'package:flutter/material.dart';
import 'package:money_manage/screens/transactions_screen.dart';

import '../configs/size_config.dart';

class AddTransactionDemo extends StatefulWidget {
  const AddTransactionDemo({super.key});

  @override
  State<AddTransactionDemo> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransactionDemo> {
  String firstName = 'NAme';
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockWidth * 5,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Transactions(),
                            ),
                          );
                        },
                        icon: Icon(Icons.arrow_back_ios),
                      ),
                      SizedBox(
                        width: SizeConfig.blockWidth * 16,
                      ),
                      Text(
                        "Add Transaction",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockWidth * 5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      hintText: 'Please enter your name',
                      border: UnderlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    onChanged: (value) => {
                      setState(() {
                        firstName = value;
                      })
                    },
                  ),
                  SizedBox(height: 10,),
                  Text("First Name : $firstName")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}