import '../../data/models/recipe_model.dart';

abstract class IRecipesRepository {
  Future<List<RecipeModel>> getRecipes({required String endpoint});
}
