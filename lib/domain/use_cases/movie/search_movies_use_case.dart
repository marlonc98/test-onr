import 'package:either_dart/either.dart';
import 'package:test_rappi/domain/entities/exception_entity.dart';
import 'package:test_rappi/domain/entities/movie/movie_entity.dart';
import 'package:test_rappi/domain/entities/search_result_entity.dart';
import 'package:test_rappi/domain/repositories/movie_repository.dart';

class SearchMoviesUseCase {
  final MovieRepository _movieRepository;
  SearchMoviesUseCase({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  Future<Either<ExceptionEntity, SearchResultEntity<MovieEntity>>> call({
    required int page,
    required String query,
    required int itemsPerPage,
  }) =>
      _movieRepository.serchMovies(
          page: page, query: query, itemsPerPage: itemsPerPage);
}
