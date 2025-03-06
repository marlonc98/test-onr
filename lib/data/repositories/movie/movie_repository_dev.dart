import 'package:either_dart/either.dart';
import 'package:test_rappi/data/repositories/movie/api/get_movie_by_id_api_impl.dart';
import 'package:test_rappi/data/repositories/movie/api/get_movies_for_genre_id_api_impl.dart';
import 'package:test_rappi/data/repositories/movie/api/get_popular_movies_api_impl.dart';
import 'package:test_rappi/data/repositories/movie/api/get_top_rated_movies_api_impl.dart';
import 'package:test_rappi/data/repositories/movie/api/search_movie_by_name_api_impl.dart';
import 'package:test_rappi/domain/entities/exception_entity.dart';
import 'package:test_rappi/domain/entities/movie/movie_entity.dart';
import 'package:test_rappi/domain/entities/search_result_entity.dart';
import 'package:test_rappi/domain/repositories/movie_repository.dart';

class MovieRepositoryDev extends MovieRepository {
  @override
  Future<Either<ExceptionEntity, MovieEntity>> getMovieById(int id) =>
      getMovieByIdApiIpml(id);

  @override
  Future<Either<ExceptionEntity, List<MovieEntity>>> getMoviesForGender(
          {required int genderId, required int limit}) =>
      getMoviesForGenreIdApiImpl(genderId);

  @override
  Future<Either<ExceptionEntity, List<MovieEntity>>> getPopularMovies() =>
      getPopularMoviesApiImpl();

  @override
  Future<Either<ExceptionEntity, List<MovieEntity>>> getTopRatedMovies() =>
      getTopRatedMoviesApiImpl();

  @override
  Future<Either<ExceptionEntity, SearchResultEntity<MovieEntity>>> serchMovies(
          {required int page,
          required String query,
          required int itemsPerPage}) =>
      searchMovieByNameApiImpl(
          page: page, query: query, itemsPerPage: itemsPerPage);
}
