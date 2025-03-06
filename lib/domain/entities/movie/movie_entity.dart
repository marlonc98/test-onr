import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_rappi/domain/entities/genrer/genrer_entity.dart';
part 'movie_entity.freezed.dart';
part 'movie_entity.g.dart';

@freezed
class MovieEntity with _$MovieEntity {
  const factory MovieEntity({
    required int id,
    required String title,
    required String overview,
    required String releaseDate,
    required String posterPath,
    required String originalLanguage,
    required int voteAverage,
    required String originalTitle,
    required List<GenrerEntity> genrers,
  }) = _MovieEntity;

  factory MovieEntity.fromJson(Map<String, dynamic> json) =>
      _$MovieEntityFromJson(json);
}
