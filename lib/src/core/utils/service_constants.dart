import '.secret.dart';

abstract class ServiceConstants {
  static const String baseUrl = 'https://api.spoonacular.com';
  static const Map<String, String> endpoints = <String, String>{
    'Random': '/recipes/random?number=10',
    'Similar': '/recipes/{id}/similar',
    'Nutrition Label': '/recipes/{id}/nutritionLabel',
    'Ingredients': '/recipes/{id}/ingredientWidget.json',
    'Recipe': '/recipes/{id}/information',
  };
  static const Map<String, dynamic> auth = <String, dynamic>{
    'x-api-key': apiKey,
  };
}
