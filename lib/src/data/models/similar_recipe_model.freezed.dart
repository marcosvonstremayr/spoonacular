// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'similar_recipe_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SimilarRecipeModel _$SimilarRecipeModelFromJson(Map<String, dynamic> json) {
  return _SimilarRecipeModel.fromJson(json);
}

/// @nodoc
mixin _$SimilarRecipeModel {
  int get id => throw _privateConstructorUsedError;
  String get imageType => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get readyInMinutes => throw _privateConstructorUsedError;
  int get servings => throw _privateConstructorUsedError;
  String get sourceUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SimilarRecipeModelCopyWith<SimilarRecipeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimilarRecipeModelCopyWith<$Res> {
  factory $SimilarRecipeModelCopyWith(
          SimilarRecipeModel value, $Res Function(SimilarRecipeModel) then) =
      _$SimilarRecipeModelCopyWithImpl<$Res, SimilarRecipeModel>;
  @useResult
  $Res call(
      {int id,
      String imageType,
      String title,
      int readyInMinutes,
      int servings,
      String sourceUrl});
}

/// @nodoc
class _$SimilarRecipeModelCopyWithImpl<$Res, $Val extends SimilarRecipeModel>
    implements $SimilarRecipeModelCopyWith<$Res> {
  _$SimilarRecipeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageType = null,
    Object? title = null,
    Object? readyInMinutes = null,
    Object? servings = null,
    Object? sourceUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageType: null == imageType
          ? _value.imageType
          : imageType // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      readyInMinutes: null == readyInMinutes
          ? _value.readyInMinutes
          : readyInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      servings: null == servings
          ? _value.servings
          : servings // ignore: cast_nullable_to_non_nullable
              as int,
      sourceUrl: null == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SimilarRecipeModelCopyWith<$Res>
    implements $SimilarRecipeModelCopyWith<$Res> {
  factory _$$_SimilarRecipeModelCopyWith(_$_SimilarRecipeModel value,
          $Res Function(_$_SimilarRecipeModel) then) =
      __$$_SimilarRecipeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String imageType,
      String title,
      int readyInMinutes,
      int servings,
      String sourceUrl});
}

/// @nodoc
class __$$_SimilarRecipeModelCopyWithImpl<$Res>
    extends _$SimilarRecipeModelCopyWithImpl<$Res, _$_SimilarRecipeModel>
    implements _$$_SimilarRecipeModelCopyWith<$Res> {
  __$$_SimilarRecipeModelCopyWithImpl(
      _$_SimilarRecipeModel _value, $Res Function(_$_SimilarRecipeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageType = null,
    Object? title = null,
    Object? readyInMinutes = null,
    Object? servings = null,
    Object? sourceUrl = null,
  }) {
    return _then(_$_SimilarRecipeModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageType: null == imageType
          ? _value.imageType
          : imageType // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      readyInMinutes: null == readyInMinutes
          ? _value.readyInMinutes
          : readyInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      servings: null == servings
          ? _value.servings
          : servings // ignore: cast_nullable_to_non_nullable
              as int,
      sourceUrl: null == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SimilarRecipeModel implements _SimilarRecipeModel {
  const _$_SimilarRecipeModel(
      {required this.id,
      required this.imageType,
      required this.title,
      required this.readyInMinutes,
      required this.servings,
      required this.sourceUrl});

  factory _$_SimilarRecipeModel.fromJson(Map<String, dynamic> json) =>
      _$$_SimilarRecipeModelFromJson(json);

  @override
  final int id;
  @override
  final String imageType;
  @override
  final String title;
  @override
  final int readyInMinutes;
  @override
  final int servings;
  @override
  final String sourceUrl;

  @override
  String toString() {
    return 'SimilarRecipeModel(id: $id, imageType: $imageType, title: $title, readyInMinutes: $readyInMinutes, servings: $servings, sourceUrl: $sourceUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SimilarRecipeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageType, imageType) ||
                other.imageType == imageType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.readyInMinutes, readyInMinutes) ||
                other.readyInMinutes == readyInMinutes) &&
            (identical(other.servings, servings) ||
                other.servings == servings) &&
            (identical(other.sourceUrl, sourceUrl) ||
                other.sourceUrl == sourceUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, imageType, title, readyInMinutes, servings, sourceUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SimilarRecipeModelCopyWith<_$_SimilarRecipeModel> get copyWith =>
      __$$_SimilarRecipeModelCopyWithImpl<_$_SimilarRecipeModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SimilarRecipeModelToJson(
      this,
    );
  }
}

abstract class _SimilarRecipeModel implements SimilarRecipeModel {
  const factory _SimilarRecipeModel(
      {required final int id,
      required final String imageType,
      required final String title,
      required final int readyInMinutes,
      required final int servings,
      required final String sourceUrl}) = _$_SimilarRecipeModel;

  factory _SimilarRecipeModel.fromJson(Map<String, dynamic> json) =
      _$_SimilarRecipeModel.fromJson;

  @override
  int get id;
  @override
  String get imageType;
  @override
  String get title;
  @override
  int get readyInMinutes;
  @override
  int get servings;
  @override
  String get sourceUrl;
  @override
  @JsonKey(ignore: true)
  _$$_SimilarRecipeModelCopyWith<_$_SimilarRecipeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
