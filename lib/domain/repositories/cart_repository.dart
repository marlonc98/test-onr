import 'package:either_dart/either.dart';
import 'package:test_onr/domain/entities/cart_item/cart_item_entity.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/product/product_entity.dart';

abstract class CartRepository {
  Future<Either<ExceptionEntity, void>> setInCart(
      ProductEntity product, int quantity);
  Future<Either<ExceptionEntity, void>> removeFromCart(ProductEntity product);
  Future<Either<ExceptionEntity, List<CartItemEntity>>> getCart();
  Future<Either<ExceptionEntity, void>> clearCart();
}
