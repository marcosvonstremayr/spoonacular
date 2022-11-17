import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart' hide Response;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spoonacular/src/core/utils/service_constants.dart';
import 'package:spoonacular/src/data/datasources/remote/api_service.dart';

import '../mocks.dart';
import 'api_service_unit_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio dio;
  late ApiService apiService;

  setUp(() {
    dio = MockDio();
    Get.put<Dio>(dio);
    apiService = ApiService();
  });

  test('Api Service unit test', () async {
    when(
      dio.get(ServiceConstants.endpoints['Random']!),
    ).thenAnswer((_) async {
      return Response(
        data: apiResponse,
        requestOptions:
            RequestOptions(path: ServiceConstants.endpoints['Random']!),
        statusCode: HttpStatus.ok,
      );
    });
    Response<dynamic> response = await apiService.getApiResponse(
      endpoint: ServiceConstants.endpoints['Random']!,
    );
    expect(
      response.data,
      apiResponse,
    );
    expect(
      response.statusCode,
      HttpStatus.ok,
    );
  });
}
