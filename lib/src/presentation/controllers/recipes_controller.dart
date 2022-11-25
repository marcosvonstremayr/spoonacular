import 'package:get/get.dart';

import '../../core/controller/i_recipes_controller.dart';
import '../../data/models/recipe_model.dart';
import '../../domain/usecases/get_recipes_usecase.dart';

class RecipesController extends GetxController
    with StateMixin<List<RecipeModel>>
    implements IRecipesController {

  final GetRecipesUseCase _getRecipesUseCase = Get.find<GetRecipesUseCase>();

  RxList<RecipeModel> recipes = RxList<RecipeModel>();

  @override
  Future<void> getRandomRecipes({required String endpoint}) async {
    change(
      null,
      status: RxStatus.loading(),
    );
    try {
      recipes.assignAll(await _getRecipesUseCase(params: endpoint));
      if (recipes.isEmpty) {
        change(
          null,
          status: RxStatus.empty(),
        );
      } else {
        change(
          recipes,
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
}
