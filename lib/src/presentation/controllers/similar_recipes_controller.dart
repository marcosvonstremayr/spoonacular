import 'package:get/get.dart';

import '../../core/controller/i_similar_recipes_controller.dart';
import '../../data/models/recipe_model.dart';
import '../../data/models/similar_recipe_model.dart';
import '../../domain/usecases/get_recipe_information_usecase.dart';
import '../../domain/usecases/get_similar_recipes_usecase.dart';


class SimilarRecipesController extends GetxController
    with StateMixin<List<SimilarRecipeModel>>
    implements ISimilarRecipesController {

  final GetSimilarRecipesUseCase _getSimilarRecipesUseCase = Get.find<
      GetSimilarRecipesUseCase>();
  final GetRecipeInformationUseCase _getRecipeInformationUseCase = Get.find<
      GetRecipeInformationUseCase>();

  RxList<SimilarRecipeModel> similarRecipes = RxList<SimilarRecipeModel>();

  @override
  Future<void> getSimilarRecipes({required String endpoint}) async {
    change(
      null,
      status: RxStatus.loading(),
    );
    try {
      similarRecipes.assignAll(
        await _getSimilarRecipesUseCase(params: endpoint),);
      if (similarRecipes.isEmpty) {
        change(
          null,
          status: RxStatus.empty(),
        );
      } else {
        change(
          similarRecipes,
          status: RxStatus.success(),
        );
      }
    } catch (e) {
      change(
        null,
        status: RxStatus.error('$e'),
      );
    }
  }

  @override
  Future<RecipeModel> getRecipeInformation({required String endpoint}) async {
    return await _getRecipeInformationUseCase(params: endpoint);
  }
}
