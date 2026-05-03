import 'package:flutter/material.dart';
import 'package:money_manage/configs/size_config.dart';
import 'package:money_manage/providers/app_state_provider.dart';
import 'package:money_manage/providers/transaction_provider.dart';
import 'package:money_manage/screens/add_transaction.dart';
import 'package:money_manage/screens/input_fields.dart';
import 'package:money_manage/screens/analytics.dart';
import 'package:money_manage/screens/home_screen.dart';
import 'package:money_manage/screens/success_screen.dart';
import 'package:money_manage/screens/transactions_screen.dart';
import 'package:provider/provider.dart';
import 'screens/dashboard.dart';
import 'screens/launch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppStateProvider()..init()),
        ChangeNotifierProvider(create: (_) => TransactionProvider())
      ],
        child: Consumer<AppStateProvider>(
          builder: (context, appState, _) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,

              home: appState.isFirstTime
                  ? const LaunchScreen()
                  : const Dashboard(),

                // initialRoute: '/',
                // '/': (context) => LaunchScreen(),

              routes: {
                '/home': (context) => HomeScreen(),
                '/transactions': (context) => Transactions(),
                '/transaction-add': (context) => AddTransaction(),
                '/transaction-success': (context) => SuccessScreen(),
                '/analytics': (context) => Analytics(),
                '/input-fields': (context) => InputFields(),
              },

              builder: (context, child) {
                SizeConfig.init(context);
                return child!;
              },
              
              themeMode: appState.themeMode,
              theme: ThemeData(
                // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                colorScheme: const ColorScheme.light()
              ),
              darkTheme: ThemeData(
                  colorScheme: const ColorScheme.dark(),
                textTheme: TextTheme(
                  bodyMedium: TextStyle(
                    color: Colors.blue
                  )
                )

              ),
            );
          },
        ),




    );
  }
}
