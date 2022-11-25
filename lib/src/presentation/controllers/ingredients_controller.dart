import 'package:get/get.dart';

import '../../data/models/ingredient_model.dart';
import '../../core/controller/i_ingredients_controller.dart';
import '../../domain/usecases/get_ingredients_usecase.dart';

class IngredientsController extends GetxController
    with StateMixin<List<IngredientModel>>
    implements IIngredientsController {
  final GetIngredientsUseCase _getIngredientsUseCase =
      Get.find<GetIngredientsUseCase>();

  RxList<IngredientModel> ingredients = RxList<IngredientModel>();

  @override
  Future<void> getRecipeIngredients({required String endpoint}) async {
    change(
      null,
      status: RxStatus.loading(),
    );
    try {
      ingredients.assignAll(await _getIngredientsUseCase(params: endpoint));
      if (ingredients.isEmpty) {
        change(
          null,
          status: RxStatus.empty(),
        );
      } else {
        change(
          ingredients,
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
