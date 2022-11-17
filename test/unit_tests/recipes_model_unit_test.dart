import 'package:flutter_test/flutter_test.dart';
import 'package:spoonacular/src/data/models/recipe_model.dart';

import '../mocks.dart';

void main() {
  group('Recipe Model From Json unit test', () {
    test('RecipeModel fromJson test', () {
      RecipeModel recipeModel = RecipeModel.fromJson(
        apiResponse['recipes']![0],);
      expect(
        recipeModel,
        isInstanceOf<RecipeModel>(),
      );
    });
    test('RecipeModel.fromJson corrupted json', () {
      expect(
            () => RecipeModel.fromJson(apiCorruptedResponse['recipes']![0]),
        throwsA(isA<TypeError>()),
      );
    });
  });
}
