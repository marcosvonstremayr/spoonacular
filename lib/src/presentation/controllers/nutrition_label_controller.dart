import 'package:get/get.dart';

import '../../core/controller/i_nutrition_label_controller.dart';
import '../../domain/usecases/get_nutrition_label_usecase.dart';

class NutritionLabelController extends GetxController
    with StateMixin<String>
    implements INutritionLabelController {
  final GetNutritionLabelUseCase _getNutritionLabelUseCase =
      Get.find<GetNutritionLabelUseCase>();

  RxString nutritionLabel = RxString("");

  @override
  Future<void> getRecipeNutritionLabel({required String endpoint}) async {
    change(
      null,
      status: RxStatus.loading(),
    );
    try {
      nutritionLabel(await _getNutritionLabelUseCase(params: endpoint));
      if (nutritionLabel.isEmpty) {
        change(
          null,
          status: RxStatus.empty(),
        );
      } else {
        change(
          nutritionLabel.value,
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
