import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_onr/domain/entities/cart_item/cart_item_entity.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/product/product_entity.dart';

Future<Either<ExceptionEntity, void>> setInCartApiFake({
  required ProductEntity product,
  required int quantity,
  required String cartSharedPrefKey,
}) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = prefs.getString(cartSharedPrefKey);
    List<CartItemEntity> cart = cartJson != null
        ? (jsonDecode(cartJson) as List)
            .map((item) => CartItemEntity.fromJson(item))
            .toList()
        : [];

    if (quantity <= 0) {
      cart.removeWhere((item) => item.product.id == product.id);
    } else {
      final index = cart.indexWhere((item) => item.product.id == product.id);
      if (index != -1) {
        cart[index] = CartItemEntity(product: product, quantity: quantity);
      } else {
        cart.add(CartItemEntity(product: product, quantity: quantity));
      }
    }

    await prefs.setString(cartSharedPrefKey, jsonEncode(cart));
    return const Right(null);
  } catch (e) {
    return Left(ExceptionEntity.fromException(e));
  }
}
