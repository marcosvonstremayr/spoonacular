import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../core/utils/service_constants.dart';
import '../data/datasources/remote/api_service.dart';
import '../data/repositories/recipes_repository.dart';
import '../domain/usecases/get_recipes_usecase.dart';
import '../presentation/controllers/recipes_controller.dart';

class Dependencies {
  void onInit() {
    Get.put(
      Dio(
        BaseOptions(
          baseUrl: ServiceConstants.baseUrl,
          headers: ServiceConstants.auth,
        ),
      ),
    );
    Get.put(ApiService());
    Get.put(RecipesRepository());
    Get.put(GetRecipesUseCase());
    Get.lazyPut(
      () => RecipesController()
        ..getRandomRecipes(endpoint: ServiceConstants.endpoints['Random']!),
    );
  }
}
