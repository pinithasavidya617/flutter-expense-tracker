import 'package:dio/dio.dart';
import 'package:money_manage/api/util/api_response.dart';
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

  Future<ApiResponse<TransactionModel>> createTransaction(TransactionModel transactionModel) async {
    try {
      Response response = await _dioClient.post("transactions/", data: transactionModel.toJson());
      TransactionModel dioTransaction = TransactionModel.fromJson( response.data );

      // return TransactionModel.fromJson(response.data);
      return ApiResponse.success(dioTransaction);
    }
    on DioException catch( e ){
      return ApiResponse<TransactionModel>(
        status: e.response?.statusCode ?? 500,
        error: e.message ?? "Something went wrong"

      );
    }
    catch (e) {
      return ApiResponse.error("Unknown Error");
    }
  }

  Future<ApiResponse<TransactionModel>> updateTransaction(TransactionModel transactionModel) async {
    try {
      Response response = await _dioClient.patch("transactions/${transactionModel.id}", data: transactionModel.toJson());
      TransactionModel dioTransaction = TransactionModel.fromJson( response.data );

      return ApiResponse.success(dioTransaction);
    }
    on DioException catch( e ){
      return ApiResponse<TransactionModel>(
          status: e.response?.statusCode ?? 500,
          error: e.message ?? "Something went wrong"

      );
    }
    catch (e) {
      return ApiResponse.error("Unknown Error");
    }
  }
}
