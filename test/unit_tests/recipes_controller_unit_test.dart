import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spoonacular/src/core/utils/service_constants.dart';
import 'package:spoonacular/src/data/models/recipe_model.dart';
import 'package:spoonacular/src/domain/usecases/get_recipes_usecase.dart';
import 'package:spoonacular/src/presentation/controllers/recipes_controller.dart';

import '../mocks.dart';
import 'recipes_controller_unit_test.mocks.dart';

@GenerateMocks([GetRecipesUseCase])
void main() {
  late MockGetRecipesUseCase useCase;
  late RecipesController controller;

  setUp(() {
    useCase = MockGetRecipesUseCase();
    Get.put<GetRecipesUseCase>(useCase);
    controller = RecipesController();
  });

  test('GetX Recipes Controller test', () async {
    when(useCase(params: ServiceConstants.endpoints['Random']!))
        .thenAnswer((_) async {
      return <RecipeModel>[RecipeModel.fromJson(apiResponse['recipes']![0])];
    });
    await controller.getRandomRecipes(
      endpoint: ServiceConstants.endpoints['Random']!,
    );
    expect(
      controller.recipes.length,
      1,
    );
  });
}
