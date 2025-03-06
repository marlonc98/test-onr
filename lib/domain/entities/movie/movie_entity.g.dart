// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieEntityImpl _$$MovieEntityImplFromJson(Map<String, dynamic> json) =>
    _$MovieEntityImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      overview: json['overview'] as String,
      releaseDate: json['releaseDate'] as String,
      posterPath: json['posterPath'] as String,
      originalLanguage: json['originalLanguage'] as String,
      voteAverage: (json['voteAverage'] as num).toInt(),
      originalTitle: json['originalTitle'] as String,
      genrers: (json['genrers'] as List<dynamic>)
          .map((e) => GenrerEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MovieEntityImplToJson(_$MovieEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'releaseDate': instance.releaseDate,
      'posterPath': instance.posterPath,
      'originalLanguage': instance.originalLanguage,
      'voteAverage': instance.voteAverage,
      'originalTitle': instance.originalTitle,
      'genrers': instance.genrers,
    };
