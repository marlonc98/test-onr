import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:get_it/get_it.dart';
import 'package:test_onr/data/dto/product_host_dto.dart';
import 'package:test_onr/data/settings/rest_api.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/product/product_entity.dart';
import 'package:test_onr/utils/key_words_constants.dart';

Future<Either<ExceptionEntity, ProductEntity>> getProductByIdApiImpl(
    int id) async {
  try {
    String relativeUrl = '/products/$id';
    String? response = await GetIt.I.get<RestApi>().get(relativeUrl);
    if (response == null) {
      return Left(
          ExceptionEntity(code: KeyWordsConstants.serverErrorProductNotFound));
    }
    Map<String, dynamic> responseMap = jsonDecode(response);
    ProductEntity movie = ProductHostDto.fromJson(responseMap);
    return Right(movie);
  } catch (e) {
    return Left(ExceptionEntity.fromException(e));
  }
}
