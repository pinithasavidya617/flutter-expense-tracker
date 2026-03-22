import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_manage/screens/transactions_screen.dart';

import '../configs/size_config.dart';

class InputFields extends StatefulWidget {
  const InputFields({super.key});

  @override
  State<InputFields> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<InputFields> {
  String submission = 'No errors';
  bool showPassword = false;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final amountController = TextEditingController();
  final dateController = TextEditingController();

  String gender = "M";
  bool termsAndConditions = false;
  bool active = true;

  Future<void> _pickDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2100));

    if (date != null) {
      dateController.text = date.toString();
    }
  }

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
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: firstNameController,
                            decoration: InputDecoration(
                              label: Text.rich(TextSpan(
                                  text: "First Name",
                                  children: [
                                    TextSpan(
                                        text: " * ",
                                        style: TextStyle(color: Colors.red))
                                  ])),
                              // labelText: 'First Name',
                              hintText: 'Please enter your name',
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(Icons.person),
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10)
                            ], //max length
                            keyboardType: TextInputType.text,
                            maxLength: 10,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "First name is required";
                              }
                              return null;
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
                            obscureText:
                                !showPassword, //hide text like password
                            // onChanged: (value) => {
                            //   setState(() {
                            //   })
                            // },
                          ),
                          TextFormField(
                            controller: amountController,
                            decoration: InputDecoration(
                              label: Text.rich(TextSpan(
                                  text: "Amount",
                                  children: [
                                    TextSpan(
                                        text: " * ",
                                        style: TextStyle(color: Colors.red))
                                  ])),
                              // labelText: 'First Name',
                              hintText: 'Please enter your amount',
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(Icons.money),
                            ),
                            inputFormatters: [
                              // FilteringTextInputFormatter.digitsOnly,
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d+\.?\d{0,2}'))
                            ],
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Amount is required";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: dateController,
                            readOnly: true,
                            onTap: () => _pickDate(context),
                            decoration: InputDecoration(
                              label: Text.rich(TextSpan(
                                text: "Date",
                              )),
                              hintText: 'Please enter transaction date',
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(Icons.calendar_month),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "First name is required";
                              }
                              return null;
                            },
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Gender"),
                              Row(
                                children: [
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text("Male"),
                                      value: "M",
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value.toString();
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text("Female"),
                                      value: "F",
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value.toString();
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Text("Selected gender is $gender")
                            ],
                          ),
                          CheckboxListTile(
                              title: Text("Accept Terms and Conditions"),
                              value: termsAndConditions,
                              onChanged: (value) {
                                setState(() {
                                  termsAndConditions = !termsAndConditions;
                                });
                              }),
                          Text("Selected terms $termsAndConditions"),
                          SwitchListTile(
                              title: Text("User active"),
                              value: active,
                              onChanged: (value) {
                                setState(() {
                                  active = !active;
                                });
                              })
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print("Successful");
                          submission = "validated";
                        } else {
                          submission = "error";
                        }
                        setState(() {});
                      },
                      child: Text("Submit")),
                  Text(submission)
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
    amountController.dispose();
    dateController.dispose();

    super.dispose();
  }
}
