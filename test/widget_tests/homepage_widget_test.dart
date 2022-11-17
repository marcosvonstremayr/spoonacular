import 'package:carousel_slider/carousel_slider.dart';
import 'package:mockito/annotations.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:spoonacular/src/core/utils/service_constants.dart';
import 'package:spoonacular/src/data/models/recipe_model.dart';
import 'package:spoonacular/src/domain/usecases/get_recipes_usecase.dart';
import 'package:spoonacular/src/presentation/controllers/recipes_controller.dart';
import 'package:spoonacular/src/presentation/views/home.dart';

import '../mocks.dart';
import '../unit_tests/recipes_controller_unit_test.mocks.dart';

@GenerateMocks([GetRecipesUseCase])
void main() {
  late RecipesController recipesController;
  late GetRecipesUseCase useCase;

  setUp(() {
    useCase = MockGetRecipesUseCase();
    Get.put(useCase);
    recipesController = RecipesController();
    Get.lazyPut(() => recipesController);
  });

  Widget buildWidget() {
    return const MaterialApp(
      home: HomePage(),
    );
  }

  group('Try splash screen', () {
    testWidgets('Run SplashScreen and look for animated splash screen',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        when(useCase(params: ServiceConstants.endpoints['Random']!))
            .thenAnswer((_) async {
          return [RecipeModel.fromJson(apiResponse['recipes']![0])];
        });
        await tester.pumpWidget(
          buildWidget(),
        );
        await recipesController.getRandomRecipes(
          endpoint: ServiceConstants.endpoints['Random']!,
        );
        await tester.pump();
        expect(
          find.byType(
            CarouselSlider,
          ),
          findsOneWidget,
        );
        expect(
          find.byType(
            Image,
          ),
          findsWidgets,
        );
        expect(
          find.text('Instant Pot Chicken Taco Soup'),
          findsWidgets,
        );
      });
    });
  });
}
