import 'package:flutter/material.dart';
import 'package:money_manage/configs/size_config.dart';
import 'package:money_manage/data/model/transaction_model.dart'; // ✅ single source of TransactionModel
import 'package:money_manage/services/dashboard_service.dart';
import 'package:money_manage/widgets/date_selection_title.dart';
import 'package:money_manage/widgets/transaction_tested_widgets/transaction_widget.dart'; // ✅ TransactionWidget lives here
import '../widgets/filter_bar.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final DashboardService _dashboardService = DashboardService();
  List<TransactionModel> transactions = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    final data = await _dashboardService.getSummaryTransactions();
    setState(() {
      transactions = List<TransactionModel>.from(data);
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
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
                      onPressed: () =>
                          Navigator.pushNamed(context, '/analytics'),
                      icon: const Icon(Icons.arrow_forward_ios)),
                ],
              ),
              SizedBox(height: SizeConfig.blockHeight * 2),
              const FilterBarWidget(),
              SizedBox(height: SizeConfig.blockHeight * 2),
              const DateSectionTitle(title: "Today, March 10"),
              Expanded(
                child: loading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: transactions.length,
                        itemBuilder: (context, index) {
                          return TransactionWidget(
                            transaction: transactions[index],
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'transactions_fab',
        onPressed: () => Navigator.pushNamed(context, '/input-fields'),
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
