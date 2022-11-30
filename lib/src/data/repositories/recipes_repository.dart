import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../../domain/repositories/i_recipe_repository.dart';
import '../datasources/remote/api_service.dart';
import '../models/ingredient_model.dart';
import '../models/recipe_model.dart';
import '../models/similar_recipe_model.dart';

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

  @override
  Future<List<IngredientModel>> getRecipeIngredients(
      {required String endpoint}) async {
    List<IngredientModel> ingredients = <IngredientModel>[];
    Response<dynamic> apiResponse =
        await _apiService.getApiResponse(endpoint: endpoint);
    List<dynamic> ingredientsList = apiResponse.data['ingredients'];
    for (int i = 0; i < ingredientsList.length; i++) {
      try {
        ingredients.add(IngredientModel.fromJson(ingredientsList[i]));
      } catch (e) {
        continue;
      }
    }
    return ingredients;
  }

  @override
  Future<String> getRecipeNutritionLabel({required String endpoint}) async {
    Response<dynamic> apiResponse =
        await _apiService.getApiResponse(endpoint: endpoint);
    return apiResponse.data;
  }

  @override
  Future<List<SimilarRecipeModel>> getSimilarRecipes({
    required String endpoint,
  }) async {
    List<SimilarRecipeModel> similarRecipes = <SimilarRecipeModel>[];
    Response<dynamic> apiResponse =
        await _apiService.getApiResponse(endpoint: endpoint);
    List<dynamic> similarRecipesList = apiResponse.data;
    for (int i = 0; i < similarRecipesList.length; i++) {
      try {
        similarRecipes.add(SimilarRecipeModel.fromJson(similarRecipesList[i]));
      } catch (e) {
        continue;
      }
    }
    return similarRecipes;
  }

  @override
  Future<RecipeModel> getRecipeInformation({required String endpoint}) async {
    late RecipeModel recipe;
    Response<dynamic> apiResponse =
        await _apiService.getApiResponse(endpoint: endpoint);
    Map<String, dynamic> recipeJson = apiResponse.data;
    try {
      recipe = RecipeModel.fromJson(recipeJson);
    } catch (e) {
      throw Exception(e);
    }
    return recipe;
  }
}
