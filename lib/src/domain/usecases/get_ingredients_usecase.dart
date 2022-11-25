import 'package:get/get.dart';

import '../../core/usecases/i_usecase.dart';
import '../../data/models/ingredient_model.dart';
import '../../data/repositories/recipes_repository.dart';

class GetIngredientsUseCase implements IUseCase<List<IngredientModel>, String> {
  final RecipesRepository _recipesRepository = Get.find<RecipesRepository>();

  @override
  Future<List<IngredientModel>> call({required String params}) async {
    return await _recipesRepository.getRecipeIngredients(endpoint: params);
  }
}
