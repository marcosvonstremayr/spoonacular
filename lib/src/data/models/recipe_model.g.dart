// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipeModel _$$_RecipeModelFromJson(Map<String, dynamic> json) =>
    _$_RecipeModel(
      vegetarian: json['vegetarian'] as bool,
      vegan: json['vegan'] as bool,
      glutenFree: json['glutenFree'] as bool,
      dairyFree: json['dairyFree'] as bool,
      veryHealthy: json['veryHealthy'] as bool,
      cheap: json['cheap'] as bool,
      veryPopular: json['veryPopular'] as bool,
      sustainable: json['sustainable'] as bool,
      lowFodmap: json['lowFodmap'] as bool,
      weightWatcherSmartPoints: json['weightWatcherSmartPoints'] as int,
      gaps: json['gaps'] as String?,
      preparationMinutes: json['preparationMinutes'] as int,
      cookingMinutes: json['cookingMinutes'] as int,
      aggregateLikes: json['aggregateLikes'] as int,
      healthScore: json['healthScore'] as int,
      creditsText: json['creditsText'] as String?,
      license: json['license'] as String?,
      sourceName: json['sourceName'] as String?,
      pricePerServing: (json['pricePerServing'] as num).toDouble(),
      extendedIngredients: (json['extendedIngredients'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>?)
          .toList(),
      id: json['id'] as int,
      title: json['title'] as String?,
      readyInMinutes: json['readyInMinutes'] as int,
      servings: json['servings'] as int,
      sourceUrl: json['sourceUrl'] as String?,
      image: json['image'] as String?,
      imageType: json['imageType'] as String?,
      summary: json['summary'] as String?,
      instructions: json['instructions'] as String?,
      analyzedInstructions: (json['analyzedInstructions'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>?)
          .toList(),
      spoonacularSourceUrl: json['spoonacularSourceUrl'] as String?,
      cuisines:
          (json['cuisines'] as List<dynamic>).map((e) => e as String?).toList(),
      dishTypes: (json['dishTypes'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
      diets: (json['diets'] as List<dynamic>).map((e) => e as String?).toList(),
      occasions: (json['occasions'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
      originalId: json['originalId'] as int?,
    );

Map<String, dynamic> _$$_RecipeModelToJson(_$_RecipeModel instance) =>
    <String, dynamic>{
      'vegetarian': instance.vegetarian,
      'vegan': instance.vegan,
      'glutenFree': instance.glutenFree,
      'dairyFree': instance.dairyFree,
      'veryHealthy': instance.veryHealthy,
      'cheap': instance.cheap,
      'veryPopular': instance.veryPopular,
      'sustainable': instance.sustainable,
      'lowFodmap': instance.lowFodmap,
      'weightWatcherSmartPoints': instance.weightWatcherSmartPoints,
      'gaps': instance.gaps,
      'preparationMinutes': instance.preparationMinutes,
      'cookingMinutes': instance.cookingMinutes,
      'aggregateLikes': instance.aggregateLikes,
      'healthScore': instance.healthScore,
      'creditsText': instance.creditsText,
      'license': instance.license,
      'sourceName': instance.sourceName,
      'pricePerServing': instance.pricePerServing,
      'extendedIngredients': instance.extendedIngredients,
      'id': instance.id,
      'title': instance.title,
      'readyInMinutes': instance.readyInMinutes,
      'servings': instance.servings,
      'sourceUrl': instance.sourceUrl,
      'image': instance.image,
      'imageType': instance.imageType,
      'summary': instance.summary,
      'instructions': instance.instructions,
      'analyzedInstructions': instance.analyzedInstructions,
      'spoonacularSourceUrl': instance.spoonacularSourceUrl,
      'cuisines': instance.cuisines,
      'dishTypes': instance.dishTypes,
      'diets': instance.diets,
      'occasions': instance.occasions,
      'originalId': instance.originalId,
    };
