import 'package:test_onr/domain/entities/cart_item/cart_item_entity.dart';
import 'package:test_onr/domain/entities/product/product_entity.dart';
import 'package:test_onr/domain/states/cart_state.dart';

class CartStateImpl extends CartState {
  List<CartItemEntity> _items = [];

  @override
  set items(List<CartItemEntity> items) {
    _items = items;
    notifyListeners();
  }

  @override
  List<CartItemEntity> get items => _items;

  @override
  void setItem(CartItemEntity item) {
    final index =
        _items.indexWhere((element) => element.product.id == item.product.id);
    if (item.quantity == 0) {
      _items.removeAt(index);
    } else if (index != -1) {
      _items[index] = item;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  @override
  void removeItem(ProductEntity product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      if (_items[index].quantity > 1) {
        _items[index] =
            _items[index].copyWith(quantity: _items[index].quantity - 1);
      } else {
        _items.removeAt(index);
      }
    }
    notifyListeners();
  }

  @override
  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  @override
  CartItemEntity? getItem(int id) {
    return _items.where((item) => item.product.id == id).firstOrNull;
  }
}
