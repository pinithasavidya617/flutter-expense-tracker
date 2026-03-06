import 'package:flutter/material.dart';
import 'package:money_manage/configs/size_config.dart';
import 'package:money_manage/screens/analytics.dart';
import 'package:money_manage/widgets/date_selection_title.dart';
import 'package:money_manage/widgets/transaction_widget.dart';
import '../widgets/filter_bar.dart';
import '../widgets/transaction_data.dart';
import 'add_transaction.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockWidth * 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),

                  const Spacer(),

                  Text(
                    "Transactions",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.blockWidth * 5),
                  ),

                  const Spacer(),

                  IconButton(
                      onPressed: () {
                        Navigator.push((context), MaterialPageRoute(
                          builder: (context) => Analytics()
                        ));
                      },
                      icon: const Icon(Icons.arrow_forward_ios)),                ],
              ),

              SizedBox(height: SizeConfig.blockHeight * 2),

              const FilterBarWidget(),

              SizedBox(height: SizeConfig.blockHeight * 2),

              const DateSectionTitle(title: "Today, March 10"),

              Expanded(
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return TransactionWidget(
                      transaction: transactions[index],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddTransaction()));
        },
        backgroundColor: Colors.deepPurple,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 15,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.home),
              Icon(Icons.receipt),
              SizedBox(width: 40),
              Icon(Icons.account_balance_wallet),
              Icon(Icons.person),
            ],
          ),
        ),
      ),
    );
  }
}