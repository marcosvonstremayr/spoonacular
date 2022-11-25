// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'similar_recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SimilarRecipeModel _$$_SimilarRecipeModelFromJson(
        Map<String, dynamic> json) =>
    _$_SimilarRecipeModel(
      id: json['id'] as int,
      imageType: json['imageType'] as String,
      title: json['title'] as String,
      readyInMinutes: json['readyInMinutes'] as int,
      servings: json['servings'] as int,
      sourceUrl: json['sourceUrl'] as String,
    );

Map<String, dynamic> _$$_SimilarRecipeModelToJson(
        _$_SimilarRecipeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageType': instance.imageType,
      'title': instance.title,
      'readyInMinutes': instance.readyInMinutes,
      'servings': instance.servings,
      'sourceUrl': instance.sourceUrl,
    };
