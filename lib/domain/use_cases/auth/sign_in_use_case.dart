import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/user/user_entity.dart';
import 'package:test_onr/domain/states/user_state.dart';
import 'package:either_dart/either.dart';
import '../../repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository authRepository;
  final UserState userState;

  SignInUseCase({
    required this.authRepository,
    required this.userState,
  });

  Future<Either<ExceptionEntity, UserEntity>> call(
      {required String email, required String password}) async {
    Either<ExceptionEntity, UserEntity> response =
        await authRepository.login(email: email, password: password);
    if (response.isRight) {
      userState.user = response.right;
    } else {
      userState.user = null;
    }
    return response;
  }
}
