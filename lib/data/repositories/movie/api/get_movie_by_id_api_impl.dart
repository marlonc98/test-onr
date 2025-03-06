import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:get_it/get_it.dart';
import 'package:test_rappi/data/dto/movie_dto.dart';
import 'package:test_rappi/data/settings/rest_api.dart';
import 'package:test_rappi/domain/entities/exception_entity.dart';
import 'package:test_rappi/domain/entities/movie/movie_entity.dart';

Future<Either<ExceptionEntity, MovieEntity>> getMovieByIdApiIpml(int id) async {
  try {
    String relativeUrl = 'movie/$id';
    String? response = await GetIt.I.get<RestApi>().get(relativeUrl);
    if (response == null) {
      return Left(ExceptionEntity(code: 'No found', message: 'No found'));
    }
    Map<String, dynamic> responseMap = jsonDecode(response);
    print("Response: $response");
    MovieEntity movie = await MovieDto.fromJson(responseMap);
    print('Movie: $movie');
    return Right(movie);
  } catch (e) {
    return Left(ExceptionEntity.fromException(e));
  }
}
