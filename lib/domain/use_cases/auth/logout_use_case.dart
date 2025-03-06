import 'package:either_dart/either.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/states/user_state.dart';
import '../../repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository authRepository;
  final UserState userState;

  LogoutUseCase({
    required this.authRepository,
    required this.userState,
  });

  Future<Either<ExceptionEntity, void>> call() async {
    Either<ExceptionEntity, void> response = await authRepository.logout();
    if (response.isRight) {
      userState.user = null;
    }
    return response;
  }
}
