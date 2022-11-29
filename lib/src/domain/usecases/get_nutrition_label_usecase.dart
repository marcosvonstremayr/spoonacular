import 'package:get/get.dart';

import '../../core/usecases/i_usecase.dart';
import '../../data/repositories/recipes_repository.dart';

class GetNutritionLabelUseCase implements IUseCase<String, String> {
  final RecipesRepository _recipesRepository = Get.find<RecipesRepository>();

  @override
  Future<String> call({required String params}) async {
    return await _recipesRepository.getRecipeNutritionLabel(endpoint: params);
  }
}
