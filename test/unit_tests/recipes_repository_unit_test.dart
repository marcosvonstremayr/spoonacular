import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spoonacular/src/core/utils/service_constants.dart';
import 'package:spoonacular/src/data/datasources/remote/api_service.dart';
import 'package:spoonacular/src/data/repositories/recipes_repository.dart';

import '../mocks.dart';
import 'recipes_repository_unit_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late MockApiService apiService;
  late RecipesRepository recipesRepository;

  setUp(() {
    apiService = MockApiService();
    Get.put<ApiService>(apiService);
    recipesRepository = RecipesRepository();
  });

  group('Recipes Repository U Testing', () {
    test('Recipes Repository test', () async {
      when(
        apiService.getApiResponse(
          endpoint: ServiceConstants.endpoints['Random']!,
        ),
      ).thenAnswer((_) async {
        return Response(
          data: apiResponse,
          requestOptions:
              RequestOptions(path: ServiceConstants.endpoints['Random']!),
          statusCode: HttpStatus.ok,
        );
      });
      expect(
        await recipesRepository.getRecipes(
          endpoint: ServiceConstants.endpoints['Random']!,
        ),
        hasLength(1),
      );
    });
  });
}
