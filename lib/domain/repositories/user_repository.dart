import 'package:either_dart/either.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/search_result_entity.dart';
import 'package:test_onr/domain/entities/user/user_entity.dart';

abstract class UserRepository {
  Future<Either<ExceptionEntity, SearchResultEntity<UserEntity>>> search({
    required int page,
    required String query,
    required int itemsPerPage,
  });
}
