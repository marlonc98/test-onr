import 'package:either_dart/either.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/repositories/cart_repository.dart';
import 'package:test_onr/domain/states/cart_state.dart';

class ClearCartUseCase {
  final CartRepository cartRepository;
  final CartState cartState;

  ClearCartUseCase({
    required this.cartRepository,
    required this.cartState,
  });

  Future<Either<ExceptionEntity, void>> call() async {
    Either<ExceptionEntity, void> response = await cartRepository.clearCart();
    if (response.isRight) {
      cartState.clearCart();
    }
    return response;
  }
}
