import 'package:test_rappi/data/dto/genre_dto.dart';
import 'package:test_rappi/domain/entities/movie/movie_entity.dart';

class MovieDto {
  static MovieEntity fromJson(Map<String, dynamic> json) {
    return MovieEntity(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      // ignore: prefer_interpolation_to_compose_strings
      posterPath: json['poster_path'] != null
          ? "https://image.tmdb.org/t/p/w1280${json['poster_path']}"
          : "",
      releaseDate: json['release_date'],
      voteAverage: (json['vote_average'] * 10).toInt(),
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      genrers: (json['genres'] as List<dynamic>?)
              ?.map((e) => GenreDto.fromJson(e))
              .toList() ??
          [],
    );
  }
}
