import 'package:dio/dio.dart';

import '../core/network/dio_client.dart';

class DashboardService {
  final DioClient _dioClient = DioClient();

  Future<List<dynamic>> getSummaryTransactions() async {
    try {
      Response response = await _dioClient.get("products");
      print(response.data["products"]);
      return response.data["products"];
    } catch (e) {
      return [];
    }
  }
}
