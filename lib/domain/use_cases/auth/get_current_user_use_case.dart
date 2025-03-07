import 'package:either_dart/either.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/user/user_entity.dart';
import 'package:test_onr/domain/states/user_state.dart';
import '../../repositories/auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository authRepository;
  final UserState userState;

  GetCurrentUserUseCase({
    required this.authRepository,
    required this.userState,
  });

  Future<Either<ExceptionEntity, UserEntity>> call() async {
    Either<ExceptionEntity, UserEntity> response =
        await authRepository.getCurrentUser();
    print("GetCurrentUserUseCase response: $response");
    if (response.isRight) {
      userState.user = response.right;
    } else {
      userState.user = null;
    }
    return response;
  }
}
