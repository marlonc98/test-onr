import 'package:either_dart/either.dart';
import 'package:test_onr/data/repositories/auth/api/get_current_user_fake.dart';
import 'package:test_onr/data/repositories/auth/api/login_api_fake.dart';
import 'package:test_onr/data/repositories/auth/api/logout_api_fake.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/user/user_entity.dart';
import 'package:test_onr/domain/repositories/auth_repository.dart';

class AuthRepositoryFake extends AuthRepository {
  final String userSharedPrefKey = 'user';
  @override
  Future<Either<ExceptionEntity, UserEntity>> getCurrentUser() =>
      getCurrentUserFake(userSharedPrefKey);

  @override
  Future<Either<ExceptionEntity, UserEntity>> login({
    required String email,
    required String password,
  }) {
    return loginApiFake(
      email: email,
      password: password,
      userSharedPrefKey: userSharedPrefKey,
    );
  }

  @override
  Future<Either<ExceptionEntity, void>> logout() {
    return logoutApiFake(userSharedPrefKey);
  }
}
