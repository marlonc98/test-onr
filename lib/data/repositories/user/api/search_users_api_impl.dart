import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:get_it/get_it.dart';
import 'package:test_onr/data/dto/user_host_dto.dart';
import 'package:test_onr/data/settings/rest_api.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/user/user_entity.dart';
import 'package:test_onr/domain/entities/search_result_entity.dart';
import 'package:test_onr/utils/key_words_constants.dart';

Future<Either<ExceptionEntity, SearchResultEntity<UserEntity>>>
    searchUsersApiImpl({
  required int page,
  required String query,
  required int itemsPerPage,
}) async {
  try {
    String relativeUrl = '/users';
    String? response = await GetIt.I.get<RestApi>().get(relativeUrl);
    if (response == null) {
      return Left(
          ExceptionEntity(code: KeyWordsConstants.serverErrorUserNotFound));
    }
    List<dynamic> responseList = jsonDecode(response);
    List<UserEntity> users = responseList
        .map((item) => UserHostDto.fromJson(item))
        .where((user) =>
            user.fullname.contains(query) || user.username.contains(query))
        .skip((page - 1) * itemsPerPage)
        .take(itemsPerPage)
        .toList();

    int maxPages = (responseList.length / itemsPerPage).ceil();

    return Right(SearchResultEntity<UserEntity>(
      data: users,
      currentPage: page,
      itemsPerPage: itemsPerPage,
      lastpage: maxPages,
      totalItems: responseList.length,
    ));
  } catch (e) {
    return Left(ExceptionEntity.fromException(e));
  }
}
