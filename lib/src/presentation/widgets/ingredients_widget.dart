import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/dimensions_constants.dart';
import '../../core/utils/string_constants.dart';
import '../../data/models/ingredient_model.dart';
import '../controllers/ingredients_controller.dart';
import 'loader_widget.dart';

Widget ingredientsWidget({required IngredientsController controller}) {
  const double ingredientsBoxHeight = 0.25;
  const double ingredientsBoxWebWidthMultiplier = 0.1;
  const double ingredientsBoxTabletWidthMultiplier = 0.4;
  const double ingredientsBoxMobileWidthMultiplier = 0.8;
  const double ingredientsContainerVerticalMargin = 5;
  const double ingredientsContainerHorizontalMargin = 10;
  const double ingredientsContainerHeightMultiplier = 0.15;
  const double ingredientsTitlePadding = 5;

  const String ingredientsImagePath =
      'https://spoonacular.com/cdn/ingredients_500x500/';
  const String emptyIngredients =
      'We couldn\'t find any ingredients for this recipe';

  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      return controller.obx(
        (List<IngredientModel>? ingredients) {
          return SizedBox(
            height: Get.height * ingredientsBoxHeight,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: ingredients?.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return Container(
                  width: constraints.maxWidth > Dimensions.tabletMaxWidth
                      ? Get.width * ingredientsBoxWebWidthMultiplier
                      : constraints.maxWidth < Dimensions.tabletMaxWidth &&
                              constraints.maxWidth > Dimensions.mobileMaxWidth
                          ? Get.width * ingredientsBoxTabletWidthMultiplier
                          : Get.width * ingredientsBoxMobileWidthMultiplier,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Dimensions.containerBorderRadius,
                    ),
                    color: Colors.grey.withOpacity(
                      Dimensions.containerBackgroundColorOpacity,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(
                          Dimensions.containerShadowOpacity,
                        ),
                        spreadRadius: Dimensions.containerShadowSpread,
                        blurRadius: Dimensions.containerShadowBlur,
                      )
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: ingredientsContainerHorizontalMargin,
                    vertical: ingredientsContainerVerticalMargin,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: constraints.maxWidth > Dimensions.tabletMaxWidth
                            ? Get.width * ingredientsBoxWebWidthMultiplier
                            : constraints.maxWidth <
                                        Dimensions.tabletMaxWidth &&
                                    constraints.maxWidth >
                                        Dimensions.mobileMaxWidth
                                ? Get.width *
                                    ingredientsBoxTabletWidthMultiplier
                                : Get.width *
                                    ingredientsBoxMobileWidthMultiplier,
                        height:
                            Get.height * ingredientsContainerHeightMultiplier,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: NetworkImage(
                              '$ingredientsImagePath${ingredients![index].image}',
                            ),
                            fit: BoxFit.fitHeight,
                          ),
                          borderRadius: BorderRadius.circular(
                            Dimensions.containerBorderRadius,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.all(ingredientsTitlePadding),
                          child: Center(
                            child: AutoSizeText(
                              ingredients[index].name,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
        onLoading: loaderWidget(size: Dimensions.loaderSmallSize),
        onEmpty: const Text(emptyIngredients),
        onError: (String? error) =>
            Text('${StringConstants.errorMessage}$error'),
      );
    },
  );
}
