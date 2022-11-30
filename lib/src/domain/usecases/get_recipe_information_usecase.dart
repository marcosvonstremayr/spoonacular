import 'package:get/get.dart';

import '../../core/usecases/i_usecase.dart';
import '../../data/models/recipe_model.dart';
import '../../data/repositories/recipes_repository.dart';

class GetRecipeInformationUseCase implements IUseCase<RecipeModel, String> {
  final RecipesRepository _recipesRepository = Get.find<RecipesRepository>();

  @override
  Future<RecipeModel> call({required String params}) async {
    return await _recipesRepository.getRecipeInformation(endpoint: params);
  }
}