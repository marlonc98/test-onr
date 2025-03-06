import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:get_it/get_it.dart';
import 'package:test_onr/data/dto/product_host_dto.dart';
import 'package:test_onr/data/settings/rest_api.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/product/product_entity.dart';
import 'package:test_onr/domain/entities/search_result_entity.dart';
import 'package:test_onr/utils/key_words_constants.dart';

Future<Either<ExceptionEntity, SearchResultEntity<ProductEntity>>>
    searchProductsApiImpl({
  required int page,
  required String query,
  required int itemsPerPage,
}) async {
  try {
    String relativeUrl = '/products';
    String? response = await GetIt.I.get<RestApi>().get(relativeUrl);
    if (response == null) {
      return Left(
          ExceptionEntity(code: KeyWordsConstants.serverErrorProductNotFound));
    }
    List<dynamic> responseList = jsonDecode(response);
    List<ProductEntity> products = responseList
        .map((item) => ProductHostDto.fromJson(item))
        .where((product) =>
            product.title.contains(query) ||
            product.description.contains(query))
        .skip((page - 1) * itemsPerPage)
        .take(itemsPerPage)
        .toList();

    int maxPages = (responseList.length / itemsPerPage).ceil();
    return Right(SearchResultEntity<ProductEntity>(
      data: products,
      currentPage: page,
      itemsPerPage: itemsPerPage,
      lastpage: maxPages,
      totalItems: responseList.length,
    ));
  } catch (e) {
    return Left(ExceptionEntity.fromException(e));
  }
}
