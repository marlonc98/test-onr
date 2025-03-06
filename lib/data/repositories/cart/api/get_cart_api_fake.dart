import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_onr/domain/entities/cart_item/cart_item_entity.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';

Future<Either<ExceptionEntity, List<CartItemEntity>>> getCartApiFake({
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
    return Right(cart);
  } catch (e) {
    return Left(ExceptionEntity.fromException(e));
  }
}
