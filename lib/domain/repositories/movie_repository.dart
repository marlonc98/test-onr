import 'package:either_dart/either.dart';
import 'package:test_rappi/domain/entities/exception_entity.dart';
import 'package:test_rappi/domain/entities/movie/movie_entity.dart';
import 'package:test_rappi/domain/entities/search_result_entity.dart';

abstract class MovieRepository {
  Future<Either<ExceptionEntity, SearchResultEntity<MovieEntity>>> serchMovies({
    required int page,
    required String query,
    required int itemsPerPage,
  });
  Future<Either<ExceptionEntity, MovieEntity>> getMovieById(int id);
  Future<Either<ExceptionEntity, List<MovieEntity>>> getPopularMovies();
  Future<Either<ExceptionEntity, List<MovieEntity>>> getTopRatedMovies();
  Future<Either<ExceptionEntity, List<MovieEntity>>> getMoviesForGender({
    required int genderId,
    required int limit,
  });
}
