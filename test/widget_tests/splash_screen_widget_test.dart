import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:spoonacular/src/presentation/controllers/recipes_controller.dart';
import 'package:spoonacular/src/presentation/views/splash_screen.dart';

class MockRecipesController extends GetxController
    with Mock
    implements RecipesController {}

void main() {
  late RecipesController recipesController;

  setUp(() {
    recipesController = MockRecipesController();
    Get.lazyPut(() => recipesController);
  });

  Widget buildWidget() {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }

  group('Try splash screen', () {
    testWidgets('Run SplashScreen and look for animated splash screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        buildWidget(),
      );
      expect(
        find.byType(
          AnimatedSplashScreen,
        ),
        findsOneWidget,
      );
    });
  });
}
