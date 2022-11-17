import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spoonacular/src/core/utils/service_constants.dart';
import 'package:spoonacular/src/data/models/recipe_model.dart';
import 'package:spoonacular/src/data/repositories/recipes_repository.dart';
import 'package:spoonacular/src/domain/usecases/get_recipes_usecase.dart';

import '../mocks.dart';
import 'get_recipes_use_case_unit_test.mocks.dart';

@GenerateMocks([RecipesRepository])
void main() {
  late MockRecipesRepository recipesRepository;
  late GetRecipesUseCase useCase;

  setUp(() {
    recipesRepository = MockRecipesRepository();
    Get.put<RecipesRepository>(recipesRepository);
    useCase = GetRecipesUseCase();
  });

  test('Get Recipes Use Case unit testing', () async {
    when(
      recipesRepository.getRecipes(
        endpoint: ServiceConstants.endpoints['Random']!,
      ),
    ).thenAnswer((_) async {
      return <RecipeModel>[RecipeModel.fromJson(apiResponse['recipes']![0])];
    });
    await useCase(params: ServiceConstants.endpoints['Random']!);
    expect(
      await useCase(params: ServiceConstants.endpoints['Random']!),
      hasLength(1),
    );
  });
}
