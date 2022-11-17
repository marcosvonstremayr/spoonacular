import 'package:get/get.dart';

import '../../core/usecases/i_usecase.dart';
import '../../data/models/recipe_model.dart';
import '../../data/repositories/recipes_repository.dart';

class GetRecipesUseCase implements IUseCase<List<RecipeModel>, String> {
  final RecipesRepository _recipesRepository = Get.find<RecipesRepository>();

  @override
  Future<List<RecipeModel>> call({required String params}) async {
    return await _recipesRepository.getRecipes(endpoint: params);
  }
}
