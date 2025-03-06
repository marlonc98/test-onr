import 'package:either_dart/either.dart';
import 'package:test_onr/data/repositories/user/api/search_users_api_impl.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/user/user_entity.dart';
import 'package:test_onr/domain/entities/search_result_entity.dart';
import 'package:test_onr/domain/repositories/user_repository.dart';

class UserRepositoryDev extends UserRepository {
  @override
  Future<Either<ExceptionEntity, SearchResultEntity<UserEntity>>> search({
    required int page,
    required String query,
    required int itemsPerPage,
  }) =>
      searchUsersApiImpl(
        page: page,
        query: query,
        itemsPerPage: itemsPerPage,
      );
}
