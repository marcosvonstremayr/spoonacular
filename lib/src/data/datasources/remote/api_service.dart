import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class ApiService {
  final Dio _dio = Get.find<Dio>();

  Future<Response<dynamic>> getApiResponse({required String endpoint}) async {
    Response<dynamic> response = await _dio.get(
      endpoint,
    );
    return response;
  }
}
