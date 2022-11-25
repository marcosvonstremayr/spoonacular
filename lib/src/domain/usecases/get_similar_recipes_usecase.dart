import 'package:get/get.dart';

import '../../core/usecases/i_usecase.dart';
import '../../data/models/similar_recipe_model.dart';
import '../../data/repositories/recipes_repository.dart';

class GetSimilarRecipesUseCase implements IUseCase<List<SimilarRecipeModel>, String> {
  final RecipesRepository _recipesRepository = Get.find<RecipesRepository>();

  @override
  Future<List<SimilarRecipeModel>> call({required String params}) async {
    return await _recipesRepository.getSimilarRecipes(endpoint: params);
  }
}
