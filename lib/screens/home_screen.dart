import 'package:flutter/material.dart';
import 'package:money_manage/screens/analytics.dart';
import 'package:money_manage/screens/dashboard.dart';
import 'package:money_manage/screens/profile_screen.dart';
import 'package:money_manage/screens/transactions_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Dashboard(),
    Transactions(),
    Analytics(),
    ProfileScreen()
  ];

  void _onSelectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onSelectPage,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: "Transactions"),
            BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Analytics"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ]),
    );
  }
}
