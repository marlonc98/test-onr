import 'package:either_dart/either.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/search_result_entity.dart';
import 'package:test_onr/domain/entities/user/user_entity.dart';
import 'package:test_onr/domain/repositories/user_repository.dart';

class UserRepositoryFake extends UserRepository {
  final List<UserEntity> _fakeUsers = [
    const UserEntity(
      id: 1,
      fullname: 'John Doe',
      username: 'johndoe',
      email: 'john.doe@example.com',
      address: '123 Main St',
      phone: '123-456-7890',
    ),
    const UserEntity(
      id: 2,
      fullname: 'Jane Smith',
      username: 'janesmith',
      email: 'jane.smith@example.com',
      address: '456 Elm St',
      phone: '987-654-3210',
    ),
    const UserEntity(
      id: 3,
      fullname: 'Alice Johnson',
      username: 'alicejohnson',
      email: 'alice.johnson@example.com',
      address: '789 Oak St',
      phone: '555-555-5555',
    ),
    const UserEntity(
      id: 4,
      fullname: 'Bob Brown',
      username: 'bobbrown',
      email: 'bob.brown@example.com',
      address: '321 Pine St',
      phone: '444-444-4444',
    ),
  ];

  @override
  Future<Either<ExceptionEntity, SearchResultEntity<UserEntity>>> search({
    required int page,
    required String query,
    required int itemsPerPage,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    const maxPages = 3;
    try {
      if (page > maxPages) {
        return Right(SearchResultEntity<UserEntity>(
            data: [],
            currentPage: page,
            itemsPerPage: itemsPerPage,
            lastpage: maxPages,
            totalItems: maxPages * itemsPerPage));
      }

      final filteredUsers = _fakeUsers
          .where((user) =>
              user.fullname.contains(query) || user.username.contains(query))
          .skip((page - 1) * itemsPerPage)
          .take(itemsPerPage)
          .toList();

      final filledList = List<UserEntity>.filled(
          itemsPerPage, filteredUsers.first,
          growable: true);
      for (int i = 0; i < filteredUsers.length; i++) {
        filledList[i] = filteredUsers[i];
      }
      final response = SearchResultEntity<UserEntity>(
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
