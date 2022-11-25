class SimilarRecipe {
  final int id;
  final String imageType;
  final String title;
  final int readyInMinutes;
  final int servings;
  final String sourceUrl;

  SimilarRecipe({
    required this.id,
    required this.imageType,
    required this.readyInMinutes,
    required this.title,
    required this.servings,
    required this.sourceUrl,
  });
}
