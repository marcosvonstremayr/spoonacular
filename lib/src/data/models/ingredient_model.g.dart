// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IngredientModel _$$_IngredientModelFromJson(Map<String, dynamic> json) =>
    _$_IngredientModel(
      name: json['name'] as String,
      image: json['image'] as String,
      amount: (json['amount'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Map<String, dynamic>),
      ),
    );

Map<String, dynamic> _$$_IngredientModelToJson(_$_IngredientModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'amount': instance.amount,
    };
