import 'package:either_dart/either.dart';
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

  Future<Either<ExceptionEntity, void>> call(ProductEntity product) async {
    Either<ExceptionEntity, void> response =
        await cartRepository.addToCart(product);
    if (response.isRight) {
      cartState.addItem(product);
    }
    return response;
  }
}
