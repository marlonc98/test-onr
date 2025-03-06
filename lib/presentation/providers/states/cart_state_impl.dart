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
  void addItem(ProductEntity product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _items[index] =
          _items[index].copyWith(quantity: _items[index].quantity + 1);
    } else {
      _items.add(CartItemEntity(product: product, quantity: 1));
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
}
