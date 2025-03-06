import 'package:either_dart/either.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/product/product_entity.dart';
import 'package:test_onr/domain/entities/search_result_entity.dart';

abstract class MovieRepository {
  Future<Either<ExceptionEntity, SearchResultEntity<ProductEntity>>>
      serchMovies({
    required int page,
    required String query,
    required int itemsPerPage,
  });
  Future<Either<ExceptionEntity, ProductEntity>> getMovieById(int id);
  Future<Either<ExceptionEntity, List<ProductEntity>>> getPopularMovies();
  Future<Either<ExceptionEntity, List<ProductEntity>>> getTopRatedMovies();
  Future<Either<ExceptionEntity, List<ProductEntity>>> getMoviesForGender({
    required int genderId,
    required int limit,
  });
}
