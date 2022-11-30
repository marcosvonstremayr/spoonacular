import '../../data/models/recipe_model.dart';

abstract class ISimilarRecipesController {
  Future<void> getSimilarRecipes({required String endpoint});
  Future<RecipeModel> getRecipeInformation({required String endpoint});
}
