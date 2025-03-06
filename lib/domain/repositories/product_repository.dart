import 'package:either_dart/either.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/product/product_entity.dart';
import 'package:test_onr/domain/entities/search_result_entity.dart';

abstract class ProductRepository {
  Future<Either<ExceptionEntity, SearchResultEntity<ProductEntity>>> search({
    required int page,
    required String query,
    required int itemsPerPage,
  });
  Future<Either<ExceptionEntity, ProductEntity>> getById(int id);
}
