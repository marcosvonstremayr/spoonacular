import 'package:flutter/material.dart';

import '../../core/utils/string_constants.dart';
import '../../presentation/views/home.dart';
import '../../presentation/views/recipe_detail.dart';
import '../../presentation/views/search_screen.dart';
import '../../presentation/views/splash_screen.dart';

abstract class Routes {
  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return <String, Widget Function(BuildContext)>{
      StringConstants.homeRoute: (BuildContext context) => const HomePage(),
      StringConstants.searchRoute: (BuildContext context) =>
          const SearchScreen(),
      StringConstants.splashScreenRoute: (BuildContext context) =>
          const SplashScreen(),
      StringConstants.recipeDetailRoute: (BuildContext context) =>
          const RecipeDetail(),
    };
  }
}
