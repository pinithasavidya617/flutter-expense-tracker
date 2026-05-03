import 'package:flutter/cupertino.dart';
import 'package:money_manage/services/transactions_service.dart';

import '../data/model/transaction_model.dart';

class TransactionProvider extends ChangeNotifier {
  final TransactionService _transactionService = TransactionService();
  List<TransactionModel> _transactions = [];
  bool _isTransactionLoading = false;

  List<TransactionModel>get transactions => _transactions;
  bool get isLoading => _isTransactionLoading;

  Future<void> loadTransactions() async {
    _isTransactionLoading = true;
    notifyListeners();
    _transactions = await _transactionService.getTransactions();
    _isTransactionLoading = false;
    notifyListeners();

  }

  Future<void> addTransactions(TransactionModel transactionModel) async {
    _transactions.insert(0, transactionModel);
    notifyListeners();

  }

}