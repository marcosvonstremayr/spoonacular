import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../core/utils/assets_constants.dart';
import '../../core/utils/service_constants.dart';
import '../../core/utils/dimensions_constants.dart';
import '../../core/utils/string_constants.dart';
import '../../data/models/recipe_model.dart';
import '../controllers/ingredients_controller.dart';
import '../controllers/nutrition_label_controller.dart';
import '../controllers/similar_recipes_controller.dart';
import '../widgets/back_arrow_widget.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/ingredients_widget.dart';
import '../widgets/likes_widget.dart';
import '../widgets/nutrition_label_widget.dart';
import '../widgets/similar_recipes_widget.dart';
import '../widgets/stroke_title_widget.dart';

class RecipeDetail extends StatefulWidget {
  const RecipeDetail({Key? key}) : super(key: key);

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  final RecipeModel recipe = Get.arguments;
  final IngredientsController ingredientsController =
      Get.find<IngredientsController>();
  final NutritionLabelController nutritionLabelController =
      Get.find<NutritionLabelController>();
  final SimilarRecipesController similarRecipesController =
      Get.find<SimilarRecipesController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ingredientsController.getRecipeIngredients(
        endpoint: ServiceConstants
            .endpoints[StringConstants.ingredientsEndpoint]!
            .replaceAll(
          StringConstants.idReplacement,
          recipe.id.toString(),
        ),
      );
      nutritionLabelController.getRecipeNutritionLabel(
        endpoint: ServiceConstants
            .endpoints[StringConstants.nutritionLabelEndpoint]!
            .replaceAll(
          StringConstants.idReplacement,
          recipe.id.toString(),
        ),
      );
      similarRecipesController.getSimilarRecipes(
        endpoint: ServiceConstants
            .endpoints[StringConstants.similarRecipesEndpoint]!
            .replaceAll(
          StringConstants.idReplacement,
          recipe.id.toString(),
        ),
      );
    });
    super.initState();
  }

  static const double titlePadding = 15;
  static const double containerHorizontalPadding = 20;
  static const double mainContainerBottomMargin = 20;
  static const double mainContainerWebWidthMultiplier = 0.7;
  static const double instructionsTopPadding = 30;
  static const double instructionsContainerVerticalMargin = 5;
  static const double instructionsContainerPadding = 5;

  static const String ingredientsTitle = 'Ingredients';
  static const String instructionsTitle = 'Instructions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.homeBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (
              BuildContext context,
              BoxConstraints constraints,
            ) {
              return Column(
                children: [
                  SizedBox(
                    width: Get.width,
                    child: Row(
                      children: [
                        backArrow(),
                        const Expanded(child: CustomAppBar()),
                        likesWidget(likes: recipe.aggregateLikes),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(titlePadding),
                    child: strokeTitle(
                      title: recipe.title!,
                      isMainTitle: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: containerHorizontalPadding,
                    ),
                    child: Wrap(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: mainContainerBottomMargin,
                          ),
                          width:
                              constraints.maxWidth > Dimensions.tabletMaxWidth
                                  ? Get.width * mainContainerWebWidthMultiplier
                                  : Get.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              strokeTitle(
                                title: ingredientsTitle,
                                isMainTitle: false,
                              ),
                              ingredientsWidget(
                                controller: ingredientsController,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: instructionsTopPadding,
                                ),
                                child: strokeTitle(
                                  title: instructionsTitle,
                                  isMainTitle: false,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: instructionsContainerVerticalMargin,
                                ),
                                padding: const EdgeInsets.all(
                                  instructionsContainerPadding,
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
                                      spreadRadius:
                                          Dimensions.containerShadowSpread,
                                      blurRadius:
                                          Dimensions.containerShadowBlur,
                                    ),
                                  ],
                                ),
                                child: Html(data: recipe.instructions),
                              ),
                            ],
                          ),
                        ),
                        nutritionLabel(
                          controller: nutritionLabelController,
                        ),
                      ],
                    ),
                  ),
                  similarRecipes(
                    controller: similarRecipesController,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
