import 'package:either_dart/either.dart';
import 'package:test_onr/data/repositories/product/api/get_product_by_id_api_impl.dart';
import 'package:test_onr/data/repositories/product/api/search_products_api_impl';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/product/product_entity.dart';
import 'package:test_onr/domain/entities/search_result_entity.dart';
import 'package:test_onr/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Either<ExceptionEntity, ProductEntity>> getById(int id) =>
      getProductByIdApiImpl(id);

  @override
  Future<Either<ExceptionEntity, SearchResultEntity<ProductEntity>>> search(
          {required int page,
          required String query,
          required int itemsPerPage}) =>
      searchProductsApiImpl(
          page: page, query: query, itemsPerPage: itemsPerPage);
}
