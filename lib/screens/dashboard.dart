import 'package:flutter/material.dart';
import 'package:money_manage/configs/size_config.dart';
import 'package:money_manage/providers/app_state_provider.dart';
import 'package:money_manage/providers/transaction_provider.dart';
import 'package:money_manage/screens/add_transaction.dart';
import 'package:money_manage/services/dashboard_service.dart';
import 'package:money_manage/widgets/transaction_tile.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DashboardService _dashboardService = DashboardService();
  // List<TransactionModel> transactions = [];

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
      Provider.of<TransactionProvider>(context, listen: false)
          .loadTransactions());


  }

  // Future<void> loadTransactions() async {
  //   final data = await _dashboardService.getSummaryTransactions();
  //   setState(() {
  //     transactions = List<TransactionModel>.from(data);
  //     print("Transactions count: ${transactions.length}");
  //
  //     loading = false;
  //   });
  // }

  Future<void> openTransactions(BuildContext context) async {
    final result = await Navigator.pushNamed(context, "/transactions");
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);
    final appStateProvider = Provider.of<AppStateProvider>(context);
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
                      appStateProvider.setDarkMode();
                    },
                    icon: Icon(
                      appStateProvider.isDarkMode
                          ? Icons.dark_mode
                          : Icons.light_mode,
                    ),
                  )
                ],
              ),
              Divider(thickness: 1),
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
                        SizedBox(height: SizeConfig.blockHeight * 0.1),
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
                                      child: Icon(Icons.arrow_downward,
                                          size: 16, color: Colors.white60),
                                    ),
                                    SizedBox(width: SizeConfig.blockWidth * 2),
                                    Text("Income",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: SizeConfig.blockWidth * 4,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Text("\$2,500",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: SizeConfig.blockWidth * 6,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.red,
                                      child: Icon(Icons.arrow_upward,
                                          size: 16, color: Colors.white60),
                                    ),
                                    SizedBox(width: SizeConfig.blockWidth * 2),
                                    Text("Expense",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: SizeConfig.blockWidth * 4,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Text("\$950",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: SizeConfig.blockWidth * 6,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockWidth * 5,
                            vertical: SizeConfig.blockHeight),
                        child: Text(
                          "Recent Transactions",
                          style: TextStyle(
                              color: Theme.of(context).brightness == Brightness.light ? Colors.red : Colors.blue,
                              fontSize: SizeConfig.blockWidth * 6,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(right: SizeConfig.blockWidth * 5),
                        child: TextButton(
                            onPressed: () => openTransactions(context),
                            child: Text("See All",
                                style: TextStyle(
                                    fontSize: SizeConfig.blockWidth * 5))),
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
                    child: transactionProvider.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.separated(
                            itemCount: transactionProvider.transactions.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) =>
                                        AddTransaction(transaction: transactionProvider.transactions[index])
                                  ));
                                },
                                child: TransactionTile(
                                    transaction: transactionProvider.transactions[index]),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(thickness: 1.2);
                            },
                          ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'dashboard_fab',
        onPressed: () {
          Navigator.pushNamed(context, '/transaction-add');
        },
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
