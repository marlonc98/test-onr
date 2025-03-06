import 'package:either_dart/either.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/user/user_entity.dart';

abstract class AuthRepository {
  Future<Either<ExceptionEntity, void>> logout();
  Future<Either<ExceptionEntity, UserEntity>> login({
    required String email,
    required String password,
  });
  Future<Either<ExceptionEntity, UserEntity>> getCurrentUser();
}
