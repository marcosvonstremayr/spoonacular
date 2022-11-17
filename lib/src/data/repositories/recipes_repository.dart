import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../../domain/repositories/i_recipe_repository.dart';
import '../datasources/remote/api_service.dart';
import '../models/recipe_model.dart';

class RecipesRepository implements IRecipesRepository {
  final ApiService _apiService = Get.find<ApiService>();

  @override
  Future<List<RecipeModel>> getRecipes({required String endpoint}) async {
    List<RecipeModel> recipes = <RecipeModel>[];
    Response<dynamic> apiResponse =
        await _apiService.getApiResponse(endpoint: endpoint);
    List<dynamic> recipesList = apiResponse.data['recipes'];
    for (int i = 0; i < recipesList.length; i++) {
      try {
        recipes.add(RecipeModel.fromJson(recipesList[i]));
      } catch (e) {
        continue;
      }
    }
    return recipes;
  }
}
