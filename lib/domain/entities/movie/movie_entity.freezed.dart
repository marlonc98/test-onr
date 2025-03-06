// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MovieEntity _$MovieEntityFromJson(Map<String, dynamic> json) {
  return _MovieEntity.fromJson(json);
}

/// @nodoc
mixin _$MovieEntity {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  String get releaseDate => throw _privateConstructorUsedError;
  String get posterPath => throw _privateConstructorUsedError;
  String get originalLanguage => throw _privateConstructorUsedError;
  int get voteAverage => throw _privateConstructorUsedError;
  String get originalTitle => throw _privateConstructorUsedError;
  List<GenrerEntity> get genrers => throw _privateConstructorUsedError;

  /// Serializes this MovieEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovieEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieEntityCopyWith<MovieEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieEntityCopyWith<$Res> {
  factory $MovieEntityCopyWith(
          MovieEntity value, $Res Function(MovieEntity) then) =
      _$MovieEntityCopyWithImpl<$Res, MovieEntity>;
  @useResult
  $Res call(
      {int id,
      String title,
      String overview,
      String releaseDate,
      String posterPath,
      String originalLanguage,
      int voteAverage,
      String originalTitle,
      List<GenrerEntity> genrers});
}

/// @nodoc
class _$MovieEntityCopyWithImpl<$Res, $Val extends MovieEntity>
    implements $MovieEntityCopyWith<$Res> {
  _$MovieEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? overview = null,
    Object? releaseDate = null,
    Object? posterPath = null,
    Object? originalLanguage = null,
    Object? voteAverage = null,
    Object? originalTitle = null,
    Object? genrers = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: null == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String,
      originalLanguage: null == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as int,
      originalTitle: null == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      genrers: null == genrers
          ? _value.genrers
          : genrers // ignore: cast_nullable_to_non_nullable
              as List<GenrerEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieEntityImplCopyWith<$Res>
    implements $MovieEntityCopyWith<$Res> {
  factory _$$MovieEntityImplCopyWith(
          _$MovieEntityImpl value, $Res Function(_$MovieEntityImpl) then) =
      __$$MovieEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String overview,
      String releaseDate,
      String posterPath,
      String originalLanguage,
      int voteAverage,
      String originalTitle,
      List<GenrerEntity> genrers});
}

/// @nodoc
class __$$MovieEntityImplCopyWithImpl<$Res>
    extends _$MovieEntityCopyWithImpl<$Res, _$MovieEntityImpl>
    implements _$$MovieEntityImplCopyWith<$Res> {
  __$$MovieEntityImplCopyWithImpl(
      _$MovieEntityImpl _value, $Res Function(_$MovieEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovieEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? overview = null,
    Object? releaseDate = null,
    Object? posterPath = null,
    Object? originalLanguage = null,
    Object? voteAverage = null,
    Object? originalTitle = null,
    Object? genrers = null,
  }) {
    return _then(_$MovieEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: null == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String,
      originalLanguage: null == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as int,
      originalTitle: null == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      genrers: null == genrers
          ? _value._genrers
          : genrers // ignore: cast_nullable_to_non_nullable
              as List<GenrerEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieEntityImpl implements _MovieEntity {
  const _$MovieEntityImpl(
      {required this.id,
      required this.title,
      required this.overview,
      required this.releaseDate,
      required this.posterPath,
      required this.originalLanguage,
      required this.voteAverage,
      required this.originalTitle,
      required final List<GenrerEntity> genrers})
      : _genrers = genrers;

  factory _$MovieEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String overview;
  @override
  final String releaseDate;
  @override
  final String posterPath;
  @override
  final String originalLanguage;
  @override
  final int voteAverage;
  @override
  final String originalTitle;
  final List<GenrerEntity> _genrers;
  @override
  List<GenrerEntity> get genrers {
    if (_genrers is EqualUnmodifiableListView) return _genrers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genrers);
  }

  @override
  String toString() {
    return 'MovieEntity(id: $id, title: $title, overview: $overview, releaseDate: $releaseDate, posterPath: $posterPath, originalLanguage: $originalLanguage, voteAverage: $voteAverage, originalTitle: $originalTitle, genrers: $genrers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.originalLanguage, originalLanguage) ||
                other.originalLanguage == originalLanguage) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.originalTitle, originalTitle) ||
                other.originalTitle == originalTitle) &&
            const DeepCollectionEquality().equals(other._genrers, _genrers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      overview,
      releaseDate,
      posterPath,
      originalLanguage,
      voteAverage,
      originalTitle,
      const DeepCollectionEquality().hash(_genrers));

  /// Create a copy of MovieEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieEntityImplCopyWith<_$MovieEntityImpl> get copyWith =>
      __$$MovieEntityImplCopyWithImpl<_$MovieEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieEntityImplToJson(
      this,
    );
  }
}

abstract class _MovieEntity implements MovieEntity {
  const factory _MovieEntity(
      {required final int id,
      required final String title,
      required final String overview,
      required final String releaseDate,
      required final String posterPath,
      required final String originalLanguage,
      required final int voteAverage,
      required final String originalTitle,
      required final List<GenrerEntity> genrers}) = _$MovieEntityImpl;

  factory _MovieEntity.fromJson(Map<String, dynamic> json) =
      _$MovieEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get overview;
  @override
  String get releaseDate;
  @override
  String get posterPath;
  @override
  String get originalLanguage;
  @override
  int get voteAverage;
  @override
  String get originalTitle;
  @override
  List<GenrerEntity> get genrers;

  /// Create a copy of MovieEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieEntityImplCopyWith<_$MovieEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
