import 'package:either_dart/either.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/product/product_entity.dart';
import 'package:test_onr/domain/entities/search_result_entity.dart';
import 'package:test_onr/domain/repositories/product_repository.dart';

class SearchProductsUseCase {
  final ProductRepository productRepository;

  SearchProductsUseCase({
    required this.productRepository,
  });

  Future<Either<ExceptionEntity, SearchResultEntity<ProductEntity>>> call({
    required int page,
    required String query,
    required int itemsPerPage,
  }) async {
    return await productRepository.search(
      page: page,
      query: query,
      itemsPerPage: itemsPerPage,
    );
  }
}
