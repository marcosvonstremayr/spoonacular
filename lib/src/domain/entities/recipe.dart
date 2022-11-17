class Recipe {
  final bool vegetarian;
  final bool vegan;
  final bool glutenFree;
  final bool dairyFree;
  final bool veryHealthy;
  final bool cheap;
  final bool veryPopular;
  final bool sustainable;
  final bool lowFodmap;
  final int weightWatcherSmartPoints;
  final String gaps;
  final int preparationMinutes;
  final int cookingMinutes;
  final int aggregateLikes;
  final int healthScore;
  final String creditsText;
  final String? license;
  final String sourceName;
  final double pricePerServing;
  final List<Map<String, dynamic>> extendedIngredients;
  final int id;
  final String title;
  final int readyInMinutes;
  final int servings;
  final String sourceUrl;
  final String image;
  final String imageType;
  final String summary;
  final List<String?> cuisines;
  final List<String?> dishTypes;
  final List<String?> diets;
  final List<String?> occasions;
  final String instructions;
  final List<Map<String, dynamic>> analyzedInstructions;
  final int? originalId;
  final String spoonacularSourceUrl;

  Recipe({
    required this.vegetarian,
    required this.vegan,
    required this.glutenFree,
    required this.dairyFree,
    required this.veryHealthy,
    required this.cheap,
    required this.veryPopular,
    required this.sustainable,
    required this.lowFodmap,
    required this.weightWatcherSmartPoints,
    required this.gaps,
    required this.preparationMinutes,
    required this.cookingMinutes,
    required this.aggregateLikes,
    required this.healthScore,
    required this.creditsText,
    this.license,
    required this.sourceName,
    required this.pricePerServing,
    required this.extendedIngredients,
    required this.id,
    required this.title,
    required this.readyInMinutes,
    required this.servings,
    required this.sourceUrl,
    required this.image,
    required this.imageType,
    required this.summary,
    required this.instructions,
    required this.analyzedInstructions,
    required this.spoonacularSourceUrl,
    required this.cuisines,
    required this.dishTypes,
    required this.diets,
    required this.occasions,
    this.originalId,
  });
}
