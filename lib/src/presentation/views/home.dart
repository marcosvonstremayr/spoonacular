import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/assets_constants.dart';
import '../../core/utils/service_constants.dart';
import '../../core/utils/string_constants.dart';
import '../../core/utils/dimensions_constants.dart';
import '../../data/models/recipe_model.dart';
import '../controllers/recipes_controller.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/empty_widget.dart';
import '../widgets/error_widget.dart';
import '../widgets/loader_widget.dart';
import '../widgets/tags_style.dart';

class HomePage extends GetView<RecipesController> {
  const HomePage({Key? key}) : super(key: key);

  static const int numberOfColumns = 3;
  static const double childAspectRatio = 8;
  static const double mainAxisSpacing = 2;
  static const double crossAxisSpacing = 4;
  static const double carouselHorizontalPadding = 20;
  static const double carouselVerticalPadding = 10;
  static const double recipeContainerBorderRadius = 10;
  static const double recipeContainerInnerPadding = 10;
  static const double recipeContainerTitleFontSize = 22;
  static const double recipeContainerTitleStroke = 3;
  static const double recipeCookingMinutesPadding = 8;
  static const double recipeCookingMinutesImageHeight = 35;
  static const double recipeContainerSummaryTitleFontSize = 22;
  static const int recipeContainerSummaryMaxLines = 6;
  static const double recipeContainerTagsVerticalPadding = 8;
  static const double recipeContainerTagsTitleFontSize = 22;
  static const double carouselViewportFraction = 0.45;
  static const double carouselViewportFractionMobile = 1;
  static const double carouselViewportFractionTablet = 0.8;
  static const int expandedFlex = 2;
  static const double loaderBackgroundSizeMultiplier = 0.25;

  static const String recipeContainerSummaryTitle = 'Summary';
  static const String htmlStyleTag = '#';
  static const String recipeContainerTagsTitle = 'Tags';
  static const String refresh = 'Refresh';

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
        child: LayoutBuilder(
          builder: (
            BuildContext context,
            BoxConstraints constraints,
          ) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const CustomAppBar(),
                ElevatedButton.icon(
                  onPressed: () => controller.getRandomRecipes(
                    endpoint: ServiceConstants
                        .endpoints[StringConstants.randomEndpoint]!,
                  ),
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text(refresh),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.grey.withOpacity(
                        Dimensions.containerBackgroundColorOpacity,
                      ),
                    ),
                  ),
                ),
                controller.obx(
                  (List<RecipeModel>? recipes) {
                    return Expanded(
                      child: CarouselSlider.builder(
                        itemCount: recipes!.length,
                        itemBuilder: (
                          BuildContext context,
                          int index,
                          int pageViewIndex,
                        ) {
                          return InkWell(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: carouselHorizontalPadding,
                                vertical: carouselVerticalPadding,
                              ),
                              height: Get.height,
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
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Expanded(
                                    flex: expandedFlex,
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                recipes[index].image!,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              Dimensions.containerBorderRadius,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.bottomLeft,
                                          padding: const EdgeInsets.all(
                                            recipeContainerInnerPadding,
                                          ),
                                          child: Stack(
                                            children: <Widget>[
                                              Text(
                                                recipes[index].title ?? StringConstants.unknownRecipe,
                                                style: TextStyle(
                                                  fontSize:
                                                      recipeContainerTitleFontSize,
                                                  foreground: Paint()
                                                    ..style =
                                                        PaintingStyle.stroke
                                                    ..strokeWidth =
                                                        recipeContainerTitleStroke
                                                    ..color = Colors.black,
                                                ),
                                              ),
                                              Text(
                                                recipes[index].title ?? StringConstants.unknownRecipe,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      recipeContainerTitleFontSize,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(
                                      recipeCookingMinutesPadding,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Image.asset(
                                          Assets.timerIconPath,
                                          height:
                                              recipeCookingMinutesImageHeight,
                                        ),
                                        Text(
                                          recipes[index]
                                              .readyInMinutes
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    recipeContainerSummaryTitle,
                                    style: TextStyle(
                                      fontSize:
                                          recipeContainerSummaryTitleFontSize,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Html(
                                    data: recipes[index].summary,
                                    style: <String, Style>{
                                      htmlStyleTag: Style(
                                        maxLines:
                                            recipeContainerSummaryMaxLines,
                                        textOverflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    },
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical:
                                          recipeContainerTagsVerticalPadding,
                                    ),
                                    child: Text(
                                      recipeContainerTagsTitle,
                                      style: TextStyle(
                                        fontSize:
                                            recipeContainerTagsTitleFontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: numberOfColumns,
                                        childAspectRatio: childAspectRatio,
                                        mainAxisSpacing: mainAxisSpacing,
                                        crossAxisSpacing: crossAxisSpacing,
                                      ),
                                      itemCount:
                                          recipes[index].getTags().length,
                                      itemBuilder: (
                                        BuildContext context,
                                        int ind,
                                      ) {
                                        return Text(
                                          recipes[index]
                                              .getTags()
                                              .keys
                                              .toList()[ind],
                                          style: tagsStyle(
                                            recipes[index]
                                                .getTags()
                                                .values
                                                .toList()[ind],
                                          ),
                                          textAlign: TextAlign.center,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () => Get.toNamed(
                              StringConstants.recipeDetailRoute,
                              arguments: recipes[index],
                            ),
                          );
                        },
                        options: CarouselOptions(
                          viewportFraction:
                              constraints.maxWidth < Dimensions.mobileMaxWidth
                                  ? carouselViewportFractionMobile
                                  : constraints.maxWidth >
                                              Dimensions.mobileMaxWidth &&
                                          constraints.maxWidth <
                                              Dimensions.tabletMaxWidth
                                      ? carouselViewportFractionTablet
                                      : carouselViewportFraction,
                          enableInfiniteScroll: true,
                          height: Get.height,
                          scrollDirection:
                              constraints.maxWidth > Dimensions.mobileMaxWidth
                                  ? Axis.horizontal
                                  : Axis.vertical,
                        ),
                      ),
                    );
                  },
                  onLoading: Expanded(
                    child: loaderWidget(size: loaderBackgroundSizeMultiplier),
                  ),
                  onEmpty: emptyWidget(context),
                  onError: (String? error) => errorWidget(
                    error!,
                    context,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
