import 'package:flutter/material.dart';
import 'package:money_manage/configs/size_config.dart';
import 'package:money_manage/data/model/transaction_model.dart';
import 'package:money_manage/screens/add_transaction.dart';
import 'package:money_manage/screens/launch_screen.dart';
import 'package:money_manage/screens/transactions_screen.dart';
import 'package:money_manage/services/dashboard_service.dart';
import 'package:money_manage/widgets/transaction_widget.dart';

import '../widgets/transaction_items.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final DashboardService _dashboardService = DashboardService();
  List posts = [];
  bool loading = true;

  @override
  void initState(){
    super.initState();
    loadPosts();

  }

  Future<void> loadPosts() async{
    final data = await _dashboardService.getSummaryTransactions();
    print(data);
    posts = data;
    loading = false;
  }

  Future<void> openTransactions(BuildContext context) async {
    final result = await Navigator.pushNamed(context, "/transactions");
    print(result);
  }

  final List<TransactionModel> transactions = [
    TransactionModel(
        iconName: 'cart',
        title: 'Grocery',
        date: DateTime(2026, 02, 22),
        amount: 45.33,
        isExpense: true),
    TransactionModel(
        iconName: 'cart',
        title: 'Salary',
        date: DateTime(2026, 02, 22),
        amount: 2000.00,
        isExpense: false),
    TransactionModel(
        iconName: 'cart',
        title: 'Uber',
        date: DateTime(2026, 02, 22),
        amount: 35.00,
        isExpense: true),
    TransactionModel(
        iconName: 'cart',
        title: 'Online Store',
        date: DateTime(2026, 02, 22),
        amount: 150.00,
        isExpense: true),
    TransactionModel(
        iconName: 'cart',
        title: 'Bank Transfer',
        date: DateTime(2026, 02, 22),
        amount: 150.00,
        isExpense: true),
    TransactionModel(
        iconName: 'cart',
        title: 'Bank Transfer',
        date: DateTime(2026, 02, 22),
        amount: 150.00,
        isExpense: true)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.chevron_left)),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockWidth * 15,
                          vertical: SizeConfig.blockHeight * 1.5),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(25)),
                      child: Text(
                        "March 2025",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.blockWidth * 3),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/transaction-add');
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const AddTransaction()));
                      },
                      icon: Icon(Icons.chevron_right)),
                ],
              ),
              Divider(
                thickness: 1,
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockWidth * 5,
                        vertical: SizeConfig.blockHeight),
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockWidth * 5,
                        vertical: SizeConfig.blockHeight * 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [Color(0xFF5C6FE4), Color(0xFFD67EB0)],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            stops: [0.3, 0.7])),
                    height: SizeConfig.blockHeight * 25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Balance",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeConfig.blockWidth * 5,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.more_horiz),
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockHeight * 0.1,
                        ),
                        Text(
                          "\$3,550.00",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.blockWidth * 8,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.green,
                                      child: Icon(
                                        Icons.arrow_downward,
                                        size: 16,
                                        color: Colors.white60,
                                      ),
                                    ),
                                    SizedBox(
                                      width: SizeConfig.blockWidth * 2,
                                    ),
                                    Text(
                                      "Income",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: SizeConfig.blockWidth * 4,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Text(
                                  "\$2,500",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: SizeConfig.blockWidth * 6,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.red,
                                      child: Icon(
                                        Icons.arrow_upward,
                                        size: 16,
                                        color: Colors.white60,
                                      ),
                                    ),
                                    SizedBox(
                                      width: SizeConfig.blockWidth * 2,
                                    ),
                                    Text(
                                      "Expense",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: SizeConfig.blockWidth * 4,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Text(
                                  "\$950",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: SizeConfig.blockWidth * 6,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockHeight * 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockWidth * 5,
                                vertical: SizeConfig.blockHeight),
                            child: Text(
                              "Recent Transactions",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: SizeConfig.blockWidth * 6,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(right: SizeConfig.blockWidth * 5),
                            child: TextButton(
                                onPressed: () => openTransactions(context),
                                child: Text(
                                  "See All",
                                  style: TextStyle(
                                      fontSize: SizeConfig.blockWidth * 5),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: SizeConfig.blockHeight * 45,
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockWidth * 4,
                        vertical: SizeConfig.blockHeight),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFFEBEDF0)),
                    child: Expanded(
                      child: ListView.separated(
                        itemCount: transactions.length,
                        itemBuilder: (context, index) {
                          return TransactionWidget(
                              transaction: transactions[index]);
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: 1.2,
                          );
                        },
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/transaction-add');
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => AddTransaction()));
        },
        backgroundColor: Colors.deepPurple,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
