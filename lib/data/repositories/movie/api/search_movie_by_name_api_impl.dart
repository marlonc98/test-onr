import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:get_it/get_it.dart';
import 'package:test_rappi/data/settings/rest_api.dart';
import 'package:test_rappi/domain/entities/exception_entity.dart';
import 'package:test_rappi/domain/entities/movie/movie_entity.dart';
import 'package:test_rappi/domain/entities/search_result_entity.dart';
import 'package:test_rappi/data/dto/movie_dto.dart';

Future<Either<ExceptionEntity, SearchResultEntity<MovieEntity>>>
    searchMovieByNameApiImpl({
  required int page,
  required String query,
  required int itemsPerPage,
}) async {
  try {
    String relativeUrl = 'search/movie?query=$query&page=$page';
    String? response = await GetIt.I.get<RestApi>().get(relativeUrl);
    if (response == null) {
      return Left(ExceptionEntity(
          code: 'Not found', message: 'No movies found for this query'));
    }
    Map<String, dynamic> responseMap = jsonDecode(response);
    List<dynamic> results = responseMap['results'];
    List<MovieEntity> movies =
        results.map((movieJson) => MovieDto.fromJson(movieJson)).toList();
    int totalItems = responseMap['total_results'];
    int totalPages = responseMap['total_pages'];
    return Right(SearchResultEntity(
      currentPage: page,
      totalItems: totalItems,
      data: movies,
      itemsPerPage: itemsPerPage,
      lastpage: totalPages,
    ));
  } catch (e) {
    print("error on searchMovieByNameApiImpl: $e");
    return Left(ExceptionEntity.fromException(e));
  }
}
