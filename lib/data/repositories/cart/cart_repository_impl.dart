import 'package:either_dart/either.dart';
import 'package:test_onr/data/repositories/cart/api/clear_cart_api_fake.dart';
import 'package:test_onr/data/repositories/cart/api/get_cart_api_fake.dart';
import 'package:test_onr/data/repositories/cart/api/set_in_cart_api_fake.dart';
import 'package:test_onr/data/repositories/cart/api/remove_from_cart_api_fake.dart';
import 'package:test_onr/domain/entities/cart_item/cart_item_entity.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/product/product_entity.dart';
import 'package:test_onr/domain/repositories/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  final String cartSharedPrefKey = 'cart';

  @override
  Future<Either<ExceptionEntity, void>> setInCart(
      ProductEntity product, int quantity) {
    return setInCartApiFake(
      product: product,
      quantity: quantity,
      cartSharedPrefKey: cartSharedPrefKey,
    );
  }

  @override
  Future<Either<ExceptionEntity, void>> removeFromCart(ProductEntity product) {
    return removeFromCartApiFake(
      product: product,
      cartSharedPrefKey: cartSharedPrefKey,
    );
  }

  @override
  Future<Either<ExceptionEntity, List<CartItemEntity>>> getCart() {
    return getCartApiFake(cartSharedPrefKey: cartSharedPrefKey);
  }

  @override
  Future<Either<ExceptionEntity, void>> clearCart() {
    return clearCartApiFake(cartSharedPrefKey: cartSharedPrefKey);
  }
}
