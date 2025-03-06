import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_onr/domain/entities/cart_item/cart_item_entity.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/product/product_entity.dart';

Future<Either<ExceptionEntity, void>> removeFromCartApiFake({
  required ProductEntity product,
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
    cart.removeWhere((item) => item.product.id == product.id);
    await prefs.setString(cartSharedPrefKey, jsonEncode(cart));
    return const Right(null);
  } catch (e) {
    return Left(ExceptionEntity.fromException(e));
  }
}
