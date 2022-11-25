import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/ingredient.dart';

part 'ingredient_model.freezed.dart';

part 'ingredient_model.g.dart';

@freezed
class IngredientModel with _$IngredientModel implements Ingredient {
  const factory IngredientModel({
    required String name,
    required String image,
    required Map<String, Map<String, dynamic>> amount,
  }) = _IngredientModel;

  factory IngredientModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientModelFromJson(json);
}
