import 'package:either_dart/either.dart';
import 'package:test_onr/domain/entities/cart_item/cart_item_entity.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/repositories/cart_repository.dart';
import 'package:test_onr/domain/states/cart_state.dart';

class GetCartUseCase {
  final CartRepository cartRepository;
  final CartState cartState;

  GetCartUseCase({
    required this.cartRepository,
    required this.cartState,
  });

  Future<Either<ExceptionEntity, List<CartItemEntity>>> call() async {
    Either<ExceptionEntity, List<CartItemEntity>> response =
        await cartRepository.getCart();
    if (response.isRight) {
      cartState.items = response.right;
    }
    return response;
  }
}
