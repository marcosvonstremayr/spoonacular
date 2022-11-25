import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../core/utils/assets_constants.dart';
import '../../core/utils/service_constants.dart';
import '../../core/utils/dimensions_constants.dart';
import '../../core/utils/string_constants.dart';
import '../../data/models/ingredient_model.dart';
import '../../data/models/recipe_model.dart';
import '../../data/models/similar_recipe_model.dart';
import '../controllers/ingredients_controller.dart';
import '../controllers/nutrition_label_controller.dart';
import '../controllers/similar_recipes_controller.dart';
import '../widgets/custom_app_bar.dart';

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
    ingredientsController.getRecipeIngredients(
      endpoint: ServiceConstants.endpoints[StringConstants.ingredientsEndpoint]!
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
    super.initState();
  }

  static const double backArrowMargin = 10;
  static const double backArrowPadding = 15;

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
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: backArrowMargin,
                            ),
                            padding: const EdgeInsets.all(backArrowPadding),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.withOpacity(
                                Dimensions.containerBackgroundColorOpacity,
                              ),
                            ),
                            child: const Icon(Icons.arrow_back),
                          ),
                          onTap: () =>
                              Get.offAllNamed(StringConstants.homeRoute),
                        ),
                        const Expanded(child: CustomAppBar()),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Text(
                        recipe.title,
                        style: TextStyle(
                          fontSize: 40,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 3
                            ..color = Colors.black,
                        ),
                      ),
                      Text(
                        recipe.title,
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: Get.height * 0.8,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: Get.width * 0.7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                height: Get.height * 0.3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Text(
                                          'Ingredients',
                                          style: TextStyle(
                                            fontSize: 30,
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 3
                                              ..color = Colors.black,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                        const Text(
                                          'Ingredients',
                                          style: TextStyle(
                                            fontSize: 30,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                    ingredientsController.obx(
                                      (List<IngredientModel>? ingredients) {
                                        return Expanded(
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: ingredients?.length,
                                            itemBuilder: (
                                              BuildContext context,
                                              int index,
                                            ) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    Dimensions
                                                        .containerBorderRadius,
                                                  ),
                                                  color:
                                                      Colors.grey.withOpacity(
                                                    Dimensions
                                                        .containerBackgroundColorOpacity,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(
                                                        0.5,
                                                      ),
                                                      spreadRadius: 3,
                                                      blurRadius: 5,
                                                    )
                                                  ],
                                                ),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 5,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: Get.width * 0.1,
                                                      height: Get.height * 0.15,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                            'https://spoonacular.com/cdn/ingredients_500x500/${ingredients![index].image}',
                                                          ),
                                                          fit: BoxFit.fitHeight,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          Dimensions
                                                              .containerBorderRadius,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      ingredients[index].name,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Text(
                                          'Instructions',
                                          style: TextStyle(
                                            fontSize: 30,
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 3
                                              ..color = Colors.black,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                        const Text(
                                          'Instructions',
                                          style: TextStyle(
                                            fontSize: 30,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          Dimensions.containerBorderRadius,
                                        ),
                                        color: Colors.grey.withOpacity(
                                          Dimensions
                                              .containerBackgroundColorOpacity,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.5,
                                            ),
                                            spreadRadius: 3,
                                            blurRadius: 5,
                                          )
                                        ],
                                      ),
                                      child: SingleChildScrollView(
                                        child:
                                            Html(data: recipe.instructions),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.25,
                          child: nutritionLabelController.obx((String? label) {
                            return Html(
                              data: label,
                              shrinkWrap: true,
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: Get.height * 0.3,
                    width: Get.width,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Text(
                              'Similar Recipes',
                              style: TextStyle(
                                fontSize: 30,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 3
                                  ..color = Colors.black,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const Text(
                              'Similar Recipes',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        similarRecipesController
                            .obx((List<SimilarRecipeModel>? similarRecipes) {
                          return Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: similarRecipes?.length,
                              itemBuilder: (
                                BuildContext context,
                                int index,
                              ) {
                                return Container(
                                  width: Get.width * 0.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      Dimensions.containerBorderRadius,
                                    ),
                                    color: Colors.grey.withOpacity(
                                      Dimensions
                                          .containerBackgroundColorOpacity,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(
                                          0.5,
                                        ),
                                        spreadRadius: 3,
                                        blurRadius: 5,
                                      )
                                    ],
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: Get.width * 0.2,
                                        height: Get.height * 0.15,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              'https://spoonacular.com/recipeImages/${similarRecipes![index].id.toString()}-480x360.${similarRecipes[index].imageType}',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            Dimensions.containerBorderRadius,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: AutoSizeText(
                                          similarRecipes[index].title,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        }),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
