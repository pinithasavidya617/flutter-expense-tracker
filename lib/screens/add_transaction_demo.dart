import 'package:flutter/material.dart';
import 'package:money_manage/screens/transactions_screen.dart';

import '../configs/size_config.dart';

class AddTransactionDemo extends StatefulWidget {
  const AddTransactionDemo({super.key});

  @override
  State<AddTransactionDemo> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransactionDemo> {
  String firstName = 'Dummy';
  bool showPassword = false;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

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
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        controller: firstNameController,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          hintText: 'Please enter your name',
                          border: UnderlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "First name is required";
                          }
                        },
                      ),
                      TextFormField(
                        controller: lastNameController,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          hintText: 'Please enter your last name',
                          border: UnderlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      TextFormField(
                        // maxLines: 5,
                        controller: passwordController,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Please enter your name',
                            border: UnderlineInputBorder(),
                            prefixIcon: Icon(Icons.key),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                icon: Icon(Icons.remove_red_eye))),
                        keyboardType: TextInputType.text,
                        obscureText: !showPassword, //hide text like password
                        // onChanged: (value) => {
                        //   setState(() {
                        //   })
                        // },
                      ),
                      TextFormField()
                    ],
                  )),
                  TextField(),
                  SizedBox(
                    height: 10,
                  ),
                  Text("First Name : $firstName")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    emailController.dispose();

    super.dispose();
  }
}
