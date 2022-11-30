import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/dimensions_constants.dart';
import '../../core/utils/service_constants.dart';
import '../../core/utils/string_constants.dart';
import '../../data/models/recipe_model.dart';
import '../../data/models/similar_recipe_model.dart';
import '../controllers/similar_recipes_controller.dart';
import 'loader_widget.dart';
import 'stroke_title_widget.dart';

Widget similarRecipes({
  required SimilarRecipesController controller,
}) {
  const double similarRecipesContainerHeightMultiplier = 0.4;
  const double similarRecipesContainerVerticalMargin = 10;
  const double similarRecipesContainerHorizontalMargin = 15;
  const double similarRecipesTitleBottomPadding = 15;
  const double similarRecipesWidthWebMultiplier = 0.2;
  const double similarRecipesWidthWebTabletMultiplier = 0.4;
  const double similarRecipesWidthMobileMultiplier = 0.8;
  const double similarRecipeItemVerticalMargin = 5;
  const double similarRecipeItemHorizontalMargin = 10;
  const double similarRecipeImageHeightMultiplier = 0.2;
  const double similarRecipeTitlePadding = 5;
  const double emptySimilarRecipesContainerPadding = 5;

  const String similarRecipesTitle = 'Similar Recipes';
  const String similarRecipeImagePath = 'https://spoonacular.com/recipeImages/';
  const String similarRecipeImageSize = '480x360';
  const String emptySimilarRecipes = 'No similar recipes were found';

  return LayoutBuilder(
    builder: (
      BuildContext context,
      BoxConstraints constraints,
    ) {
      return Container(
        height: Get.height * similarRecipesContainerHeightMultiplier,
        width: Get.width,
        margin: const EdgeInsets.symmetric(
          vertical: similarRecipesContainerVerticalMargin,
          horizontal: similarRecipesContainerHorizontalMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: similarRecipesTitleBottomPadding,
              ),
              child: strokeTitle(
                title: similarRecipesTitle,
                isMainTitle: false,
              ),
            ),
            controller.obx(
              (List<SimilarRecipeModel>? similarRecipes) {
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: similarRecipes?.length,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      return InkWell(
                        child: Container(
                          width:
                              constraints.maxWidth > Dimensions.tabletMaxWidth
                                  ? Get.width * similarRecipesWidthWebMultiplier
                                  : constraints.maxWidth <
                                              Dimensions.tabletMaxWidth &&
                                          constraints.maxWidth >
                                              Dimensions.mobileMaxWidth
                                      ? Get.width *
                                          similarRecipesWidthWebTabletMultiplier
                                      : Get.width *
                                          similarRecipesWidthMobileMultiplier,
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
                            horizontal: similarRecipeItemHorizontalMargin,
                            vertical: similarRecipeItemVerticalMargin,
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: constraints.maxWidth >
                                        Dimensions.tabletMaxWidth
                                    ? Get.width *
                                        similarRecipesWidthWebMultiplier
                                    : constraints.maxWidth <
                                                Dimensions.tabletMaxWidth &&
                                            constraints.maxWidth >
                                                Dimensions.mobileMaxWidth
                                        ? Get.width *
                                            similarRecipesWidthWebTabletMultiplier
                                        : Get.width *
                                            similarRecipesWidthMobileMultiplier,
                                height: Get.height *
                                    similarRecipeImageHeightMultiplier,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      '$similarRecipeImagePath${similarRecipes![index].id.toString()}-$similarRecipeImageSize.${similarRecipes[index].imageType}',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.containerBorderRadius,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                    similarRecipeTitlePadding,
                                  ),
                                  child: Center(
                                    child: AutoSizeText(
                                      similarRecipes[index].title,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () async {
                          RecipeModel recipe =
                              await controller.getRecipeInformation(
                            endpoint: ServiceConstants
                                .endpoints[StringConstants.recipeEndpoint]!
                                .replaceAll(
                              StringConstants.idReplacement,
                              similarRecipes[index].id.toString(),
                            ),
                          );
                          Get.offAndToNamed(
                            StringConstants.recipeDetailRoute,
                            arguments: recipe,
                          );
                        },
                      );
                    },
                  ),
                );
              },
              onLoading: loaderWidget(size: Dimensions.loaderSmallSize),
              onEmpty: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: similarRecipesContainerVerticalMargin,
                ),
                padding: const EdgeInsets.all(
                  emptySimilarRecipesContainerPadding,
                ),
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
                    ),
                  ],
                ),
                child: const Text(emptySimilarRecipes),
              ),
              onError: (String? error) => SizedBox(
                width: Get.width,
                child: Text('${StringConstants.errorMessage}$error'),
              ),
            ),
          ],
        ),
      );
    },
  );
}
