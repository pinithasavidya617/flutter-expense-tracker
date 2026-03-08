import 'package:flutter/material.dart';
import 'package:money_manage/configs/size_config.dart';
import 'package:money_manage/screens/add_transaction.dart';
import 'package:money_manage/screens/success_screen.dart';
import 'package:money_manage/screens/transactions_screen.dart';
import 'screens/home_screen.dart';
import 'screens/launch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => LaunchScreen(),
        '/home' : (context) => HomeScreen(),
        '/transactions' : (context) => Transactions(),
        '/transaction-add' : (context) => AddTransaction(),
        '/transaction-success': (context) => SuccessScreen()
      },
      builder: (context, child){
        SizeConfig.init(context);
        return child!;
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
