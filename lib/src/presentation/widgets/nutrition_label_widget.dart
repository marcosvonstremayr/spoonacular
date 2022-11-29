import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../core/utils/dimensions_constants.dart';
import '../../core/utils/string_constants.dart';
import '../controllers/nutrition_label_controller.dart';
import 'loader_widget.dart';

Widget nutritionLabel({required NutritionLabelController controller}) {
  const double labelWebWidthMultiplier = 0.25;
  const String emptyLabel = 'No nutrition label was found for this recipe';

  return LayoutBuilder(
    builder: (
      BuildContext context,
      BoxConstraints constraints,
    ) {
      return SizedBox(
        width: constraints.maxWidth > Dimensions.tabletMaxWidth
            ? Get.width * labelWebWidthMultiplier
            : Get.width,
        child: controller.obx(
          (String? label) {
            return Align(
              alignment: Alignment.topCenter,
              child: Html(
                data: label,
                shrinkWrap: true,
              ),
            );
          },
          onLoading: loaderWidget(size: Dimensions.loaderSmallSize),
          onEmpty: const Center(
            child: Text(
              emptyLabel,
            ),
          ),
          onError: (String? error) => Center(
            child: Text(
              '${StringConstants.errorMessage}$error',
            ),
          ),
        ),
      );
    },
  );
}
