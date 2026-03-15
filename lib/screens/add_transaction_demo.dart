import 'package:flutter/material.dart';

class AddTransactionDemo extends StatelessWidget {
  AddTransactionDemo({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Form(
              key: _formKey,
                child: Column(
                  children: [
                    TextFormField(

                    )
                  ],
                )),
            Text("Add Transaction"),
            ElevatedButton(onPressed: () {}, child: Text("add"))
          ],
        ),
      ),
    );
  }
}
