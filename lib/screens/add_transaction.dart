import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_manage/api/util/api_response.dart';
import 'package:money_manage/data/model/transaction_model.dart';
import 'package:money_manage/screens/transactions_screen.dart';
import 'package:provider/provider.dart';

import '../configs/size_config.dart';
import '../providers/transaction_provider.dart';
import '../services/transactions_service.dart';

class AddTransaction extends StatefulWidget {
  final TransactionModel? transaction;

  const AddTransaction({super.key , this.transaction});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final TransactionService _transactionService = TransactionService();

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final dateController = TextEditingController();
  final categoryController = TextEditingController();
  final noteController = TextEditingController();


  bool isExpense = true;
  String? selectedCategory = "Shopping";
  DateTime? selectedDate;
  final _formKey = GlobalKey<FormState>();

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;

        dateController.text =
        "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.transaction != null) {
      isExpense = widget.transaction!.transactionType == 'expense';
      titleController.text = widget.transaction!.title;
      amountController.text = widget.transaction!.amount.toString();
      noteController.text = widget.transaction!.note ?? '';
      selectedCategory = widget.transaction!.category;
      selectedDate = widget.transaction!.transactionDate;
      dateController.text = DateFormat('yyyy-MM-dd').format(widget.transaction!.transactionDate) ?? '0';
    }
  }

  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Transactions()));
                            },
                            icon: Icon(Icons.arrow_back_ios)),
                        SizedBox(
                          width: SizeConfig.blockWidth * 16,
                        ),
                        Text(
                          "Add Transaction",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.blockWidth * 5),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.blockHeight * 2),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 2,
                          )),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => isExpense = true),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: isExpense
                                      ? Colors.pinkAccent
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Text(
                                    "Expense",
                                    style: TextStyle(
                                      color: isExpense
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => isExpense = false),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: !isExpense
                                      ? Colors.greenAccent
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Text(
                                    "Income",
                                    style: TextStyle(
                                      color: !isExpense
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockHeight * 3),
                    Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: TextFormField(
                                  controller: amountController,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: "\$0.00",
                                    border: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                    fontSize: SizeConfig.blockWidth * 8,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockHeight * 3),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Title",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.blockWidth * 5,
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockHeight * 1),
                            TextFormField(
                              controller: titleController,
                              decoration: InputDecoration(
                                hintText: "Enter title",
                                border: UnderlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockHeight * 3),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Category",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.blockWidth * 5,
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockHeight * 1),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 12),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedCategory,
                                  isExpanded: true,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  items: [
                                    "Shopping",
                                    "Food",
                                    "Transport",
                                    "Bills"
                                  ]
                                      .map((item) => DropdownMenuItem(
                                            value: item,
                                            child: Row(
                                              children: [
                                                Icon(Icons.shopping_bag,
                                                    color: Colors.redAccent),
                                                SizedBox(width: 10),
                                                Text(
                                                  item,
                                                  style: TextStyle(
                                                      fontSize: SizeConfig
                                                              .blockWidth *
                                                          4),
                                                ),
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedCategory = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockHeight * 3),
                            TextFormField(
                              controller: noteController,
                              decoration: InputDecoration(
                                hintText: "Note (optional)",
                                border: UnderlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockHeight * 3),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Date",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.blockWidth * 5,
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockHeight * 1),
                            TextFormField(
                              controller: dateController,
                              readOnly: true,
                              onTap: () => selectDate(context),
                              decoration: InputDecoration(
                                hintText: "Select date",
                                suffixIcon: Icon(Icons.calendar_today),
                                border: UnderlineInputBorder(),
                              ),
                              validator: (value) {
                                if (selectedDate == null){
                                  return "Date is required";
                                }
                                return null;
                              },
                            ),
                          ],
                        )),
                    SizedBox(height: SizeConfig.blockHeight * 5),
                    // GestureDetector(
                    //   onTap: () {
                    //     // Navigator.pushAndRemoveUntil(
                    //     //   context,
                    //     //   MaterialPageRoute(
                    //     //       builder: (context) => SuccessScreen()),
                    //     //   (route) => false,
                    //     //   // route.isFirst
                    //     // );
                    //   },
                    //
                    // ),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          TransactionModel data = TransactionModel(
                            id: widget.transaction == null ? -1 : widget.transaction?.id ?? -1,
                            title: titleController.text,
                            amount: double.tryParse(amountController.text) ?? 0,
                            transactionType: isExpense ? 'expense' : 'income',
                            category: selectedCategory!,
                            note: noteController.text,
                            transactionDate:
                                selectedDate ?? DateTime.now(),
                          );

                          print("Sending: ${data.toJson()}");

                          ApiResponse<TransactionModel> response =
                          widget.transaction == null ?
                              await _transactionService.createTransaction(data) :
                              await _transactionService.updateTransaction(data);

                          if (response.status == 200 || response.status == 201){
                            transactionProvider.loadTransactions();
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/transaction-success',
                                  (route) => route.settings.name == '/home',
                              arguments: {"transaction": data},
                            );
                          }else{
                            ScaffoldMessenger.of( context ).showSnackBar(
                              SnackBar(content: Text( response.error ?? "Something went wrong", style: TextStyle(color: Colors.red),),
                              backgroundColor: Colors.black.withAlpha(6),
                              behavior: SnackBarBehavior.floating,
                              duration: const Duration( seconds: 5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)
                                ),
                              )
                            );
                          }
                          print(response.status);

                        }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.deepPurple,
                              Colors.pinkAccent,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            isExpense ? "Add Expense" : "Add Income",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.blockWidth * 4,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockHeight * 4),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    dateController.dispose();
    categoryController.dispose();
    noteController.dispose();

    super.dispose();
  }
}
