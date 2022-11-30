import '../../data/models/ingredient_model.dart';
import '../../data/models/recipe_model.dart';
import '../../data/models/similar_recipe_model.dart';

abstract class IRecipesRepository {
  Future<List<RecipeModel>> getRecipes({required String endpoint});
  Future<List<SimilarRecipeModel>> getSimilarRecipes({required String endpoint});
  Future<String> getRecipeNutritionLabel({required String endpoint});
  Future<List<IngredientModel>> getRecipeIngredients({required String endpoint});
  Future<RecipeModel> getRecipeInformation({required String endpoint});
}
