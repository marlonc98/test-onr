import 'package:either_dart/either.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/search_result_entity.dart';
import 'package:test_onr/domain/entities/user/user_entity.dart';
import 'package:test_onr/domain/repositories/user_repository.dart';

class SearchUsersUseCase {
  final UserRepository userRepository;

  SearchUsersUseCase({
    required this.userRepository,
  });

  Future<Either<ExceptionEntity, SearchResultEntity<UserEntity>>> call({
    required int page,
    required String query,
    required int itemsPerPage,
  }) async {
    return await userRepository.search(
      page: page,
      query: query,
      itemsPerPage: itemsPerPage,
    );
  }
}
