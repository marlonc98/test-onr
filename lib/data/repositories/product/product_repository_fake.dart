import 'package:either_dart/either.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/product/product_entity.dart';
import 'package:test_onr/domain/entities/search_result_entity.dart';
import 'package:test_onr/domain/repositories/product_repository.dart';
import 'package:test_onr/utils/key_words_constants.dart';

class ProductRepositoryFake extends ProductRepository {
  final List<ProductEntity> _fakeProducts = [
    const ProductEntity(
      id: 1,
      title: 'Product 1',
      description: 'Description 1',
      price: 10.0,
      imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
      category: "",
      rankingCount: 120,
      rating: 4.5,
    ),
    const ProductEntity(
      id: 2,
      title: 'Product 2',
      description: 'Description 2',
      price: 20.0,
      imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
      category: "",
      rankingCount: 120,
      rating: 4.5,
    ),
    const ProductEntity(
      id: 3,
      title: 'Product 3',
      description: 'Description 3',
      price: 30.0,
      imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
      category: "",
      rankingCount: 120,
      rating: 4.5,
    ),
    const ProductEntity(
      id: 4,
      title: 'Product 4',
      description: 'Description 4',
      price: 40.0,
      imageUrl: 'https://example.com/image4.jpg',
      category: "",
      rankingCount: 120,
      rating: 4.5,
    ),
  ];

  @override
  Future<Either<ExceptionEntity, ProductEntity>> getById(int id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      ProductEntity? product =
          _fakeProducts.where((product) => product.id == id).firstOrNull;
      if (product != null) {
        return Right(product);
      } else {
        return Left(ExceptionEntity(
            code: KeyWordsConstants.serverErrorProductNotFound));
      }
    } catch (e) {
      return Left(ExceptionEntity.fromException(e));
    }
  }

  @override
  Future<Either<ExceptionEntity, SearchResultEntity<ProductEntity>>> search({
    required int page,
    required String query,
    required int itemsPerPage,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    const maxPages = 3;
    try {
      if (page > maxPages) {
        return Right(SearchResultEntity<ProductEntity>(
            data: [],
            currentPage: page,
            itemsPerPage: itemsPerPage,
            lastpage: maxPages,
            totalItems: maxPages * itemsPerPage));
      }

      final filteredProducts = _fakeProducts
          .where((product) =>
              product.title.contains(query) ||
              product.description.contains(query))
          .skip((page - 1) * itemsPerPage)
          .take(itemsPerPage)
          .toList();

      final filledList = List<ProductEntity>.filled(
          itemsPerPage, filteredProducts.first,
          growable: true);
      for (int i = 0; i < filteredProducts.length; i++) {
        filledList[i] = filteredProducts[i];
      }
      final response = SearchResultEntity<ProductEntity>(
          data: filledList,
          currentPage: page,
          itemsPerPage: itemsPerPage,
          lastpage: maxPages,
          totalItems: maxPages * itemsPerPage);
      return Right(response);
    } catch (e) {
      return Left(ExceptionEntity.fromException(e));
    }
  }
}
