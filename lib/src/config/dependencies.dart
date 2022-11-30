import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../core/utils/service_constants.dart';
import '../data/datasources/remote/api_service.dart';
import '../data/repositories/recipes_repository.dart';
import '../domain/usecases/get_ingredients_usecase.dart';
import '../domain/usecases/get_nutrition_label_usecase.dart';
import '../domain/usecases/get_recipe_information_usecase.dart';
import '../domain/usecases/get_recipes_usecase.dart';
import '../domain/usecases/get_similar_recipes_usecase.dart';
import '../presentation/controllers/ingredients_controller.dart';
import '../presentation/controllers/nutrition_label_controller.dart';
import '../presentation/controllers/recipes_controller.dart';
import '../presentation/controllers/similar_recipes_controller.dart';

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
    Get.put(GetSimilarRecipesUseCase());
    Get.put(GetIngredientsUseCase());
    Get.put(GetNutritionLabelUseCase());
    Get.put(GetRecipeInformationUseCase());
    Get.lazyPut(
      () => RecipesController()
        ..getRandomRecipes(endpoint: ServiceConstants.endpoints['Random']!),
    );
    Get.put(IngredientsController());
    Get.put(NutritionLabelController());
    Get.put(SimilarRecipesController());
  }
}
