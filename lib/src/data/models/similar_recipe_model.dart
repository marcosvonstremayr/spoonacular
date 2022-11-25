import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/similar_recipe.dart';

part 'similar_recipe_model.freezed.dart';

part 'similar_recipe_model.g.dart';

@freezed
class SimilarRecipeModel with _$SimilarRecipeModel implements SimilarRecipe {
  const factory SimilarRecipeModel({
    required int id,
    required String imageType,
    required String title,
    required int readyInMinutes,
    required int servings,
    required String sourceUrl,
  }) = _SimilarRecipeModel;

  factory SimilarRecipeModel.fromJson(Map<String, dynamic> json) => _$SimilarRecipeModelFromJson(json);
}
