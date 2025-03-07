import 'package:test_onr/domain/entities/product/product_entity.dart';
import 'package:test_onr/domain/use_cases/cart/get_cart_use_case.dart';
import 'package:test_onr/domain/use_cases/cart/remove_from_cart_use_case.dart';
import 'package:test_onr/presentation/ui/pages/cart/cart_page.dart';
import 'package:test_onr/presentation/ui/pages/view_model.dart';

class CartPageViewModel extends ViewModel<CartPage> {
  bool loading = true;
  CartPageViewModel(
      {required super.context,
      required super.widget,
      required super.isMounted}) {
    _loadCartItems();
  }

  Future<void> _loadCartItems() async {
    await getIt.get<GetCartUseCase>().call();
    if (mounted) {
      loading = false;
      notifyListeners();
    }
  }

  void removeItem(ProductEntity product) async {
    await getIt.get<RemoveFromCartUseCase>().call(product);
    _loadCartItems();
  }
}
