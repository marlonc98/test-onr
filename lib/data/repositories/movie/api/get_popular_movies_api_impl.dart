import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:get_it/get_it.dart';
import 'package:test_rappi/data/settings/rest_api.dart';
import 'package:test_rappi/domain/entities/exception_entity.dart';
import 'package:test_rappi/domain/entities/movie/movie_entity.dart';
import 'package:test_rappi/data/dto/movie_dto.dart';

Future<Either<ExceptionEntity, List<MovieEntity>>>
    getPopularMoviesApiImpl() async {
  try {
    String relativeUrl = 'movie/popular';
    String? response = await GetIt.I.get<RestApi>().get(relativeUrl);
    if (response == null) {
      return Left(ExceptionEntity(
          code: 'Not found', message: 'No popular movies found'));
    }
    Map<String, dynamic> responseMap = jsonDecode(response);
    List<dynamic> results = responseMap['results'];
    List<MovieEntity> movies = await Future.wait(results.map((movieJson) async {
      return MovieDto.fromJson(movieJson);
    }).toList());
    return Right(movies);
  } catch (e) {
    return Left(ExceptionEntity.fromException(e));
  }
}
