import 'package:dio/dio.dart';
import 'package:money_manage/data/model/post_model.dart';
import 'package:money_manage/data/model/transaction_model.dart';

import '../core/network/dio_client.dart';

class TransactionService {
  final DioClient _dioClient = DioClient();

  Future<List<TransactionModel>> getTransactions() async {
    try {
      Response response = await _dioClient.get("transactions");
      List data = response.data;
      return data
          .map((e) => TransactionModel.fromJson(e))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<TransactionModel> createTransaction(TransactionModel transactionModel) async {
    try {
      Response response = await _dioClient.post("transactions/", data: transactionModel.toJson());
      return TransactionModel.fromJson(response.data);
    } catch (e) {
      return transactionModel;
    }
  }
}
