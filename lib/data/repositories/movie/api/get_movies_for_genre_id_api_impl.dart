import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:get_it/get_it.dart';
import 'package:test_rappi/data/dto/movie_dto.dart';
import 'package:test_rappi/data/settings/rest_api.dart';
import 'package:test_rappi/domain/entities/exception_entity.dart';
import 'package:test_rappi/domain/entities/movie/movie_entity.dart';

Future<Either<ExceptionEntity, List<MovieEntity>>> getMoviesForGenreIdApiImpl(
    int genreId) async {
  try {
    String relativeUrl = 'discover/movie?with_genres=$genreId';
    String? response = await GetIt.I.get<RestApi>().get(relativeUrl);
    if (response == null) {
      return Left(ExceptionEntity(
          code: 'Not found', message: 'No movies found for this genre'));
    }
    Map<String, dynamic> responseMap = jsonDecode(response);
    List<dynamic> results = responseMap['results'];
    List<MovieEntity> movies =
        results.map((e) => MovieDto.fromJson(e)).toList();
    return Right(movies);
  } catch (e) {
    return Left(ExceptionEntity.fromException(e));
  }
}
