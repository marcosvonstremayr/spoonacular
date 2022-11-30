import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/utils/string_constants.dart';
import '../../domain/entities/recipe.dart';

part 'recipe_model.freezed.dart';

part 'recipe_model.g.dart';

@freezed
class RecipeModel with _$RecipeModel implements Recipe {
  const RecipeModel._();

  const factory RecipeModel({
    required bool vegetarian,
    required bool vegan,
    required bool glutenFree,
    required bool dairyFree,
    required bool veryHealthy,
    required bool cheap,
    required bool veryPopular,
    required bool sustainable,
    required bool lowFodmap,
    required int weightWatcherSmartPoints,
    String? gaps,
    required int preparationMinutes,
    required int cookingMinutes,
    required int aggregateLikes,
    required int healthScore,
    String? creditsText,
    String? license,
    String? sourceName,
    required double pricePerServing,
    List<Map<String, dynamic>?>? extendedIngredients,
    required int id,
    String? title,
    required int readyInMinutes,
    required int servings,
    String? sourceUrl,
    String? image,
    String? imageType,
    String? summary,
    String? instructions,
    List<Map<String, dynamic>?>? analyzedInstructions,
    String? spoonacularSourceUrl,
    required List<String?> cuisines,
    required List<String?> dishTypes,
    required List<String?> diets,
    required List<String?> occasions,
    int? originalId,
  }) = _RecipeModel;

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);

  Map<String, bool> getTags() {
    return <String, bool>{
      StringConstants.vegetarianTag: vegetarian,
      StringConstants.veganTag: vegan,
      StringConstants.glutenFreeTag: glutenFree,
      StringConstants.dairyFreeTag: dairyFree,
      StringConstants.veryHealthyTag: veryHealthy,
      StringConstants.cheapTag: cheap,
      StringConstants.veryPopularTag: veryPopular,
      StringConstants.sustainableTag: sustainable,
      StringConstants.lowFodmapTag: lowFodmap,
    };
  }
}
