import 'package:either_dart/either.dart';
import 'package:test_onr/domain/entities/cart_item/cart_item_entity.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/product/product_entity.dart';
import 'package:test_onr/domain/repositories/cart_repository.dart';
import 'package:test_onr/domain/states/cart_state.dart';

class AddToCartUseCase {
  final CartRepository cartRepository;
  final CartState cartState;

  AddToCartUseCase({
    required this.cartRepository,
    required this.cartState,
  });

  Future<Either<ExceptionEntity, void>> call(
      ProductEntity product, int quantity) async {
    Either<ExceptionEntity, void> response =
        await cartRepository.setInCart(product, quantity);
    if (response.isRight) {
      cartState.setItem(CartItemEntity(product: product, quantity: quantity));
    }
    return response;
  }
}
