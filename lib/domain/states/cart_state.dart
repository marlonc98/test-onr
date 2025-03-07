import 'package:test_onr/domain/entities/cart_item/cart_item_entity.dart';
import 'package:test_onr/domain/entities/product/product_entity.dart';
import 'package:test_onr/domain/states/state_domain.dart';

abstract class CartState extends StateDomain {
  abstract List<CartItemEntity> items;
  setItem(CartItemEntity item);
  CartItemEntity? getItem(int id);
  removeItem(ProductEntity product);
  clearCart();
}
