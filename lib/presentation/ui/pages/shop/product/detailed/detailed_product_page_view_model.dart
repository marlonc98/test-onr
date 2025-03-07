import 'package:test_onr/domain/entities/product/product_entity.dart';
import 'package:test_onr/domain/states/cart_state.dart';
import 'package:test_onr/domain/use_cases/cart/add_to_cart_use_case.dart';
import 'package:test_onr/domain/use_cases/product/get_product_by_id_use_case.dart';
import 'package:test_onr/presentation/ui/pages/shop/product/detailed/detailed_product_page.dart';
import 'package:test_onr/presentation/ui/pages/view_model.dart';
import 'package:test_onr/utils/show_modal.dart';

class DetailedProductPageViewModel extends ViewModel<DetailedProductPage> {
  DetailedProductPageViewModel(
      {required super.context,
      required super.widget,
      required super.isMounted}) {
    _getProduct();
  }

  ProductEntity? product;
  bool loading = true;

  void _getProduct() async {
    final result = await getIt.get<GetProductByIdUseCase>().call(widget.id);
    if (result.isLeft) {
      if (mounted) {
        ShowModal.showSnackBar(
            // ignore: use_build_context_synchronously
            context: context,
            text: result.left.code,
            error: true);
      }
      loading = false;
      notifyListeners();
    } else {
      product = result.right;
      loading = false;
      notifyListeners();
    }
  }

  void handleAddToCart() async => _handleModifyQuantity(1);

  void _handleModifyQuantity(int quantity) async {
    if (product == null) return;
    await getIt.get<AddToCartUseCase>().call(product!, quantity);
    if (mounted) {
      notifyListeners();
    }
  }

  void handleLessOne() {
    if (product == null) return;
    final cartItem = getIt.get<CartState>().getItem(product!.id);
    if (cartItem == null) return;
    _handleModifyQuantity(cartItem.quantity - 1);
  }

  void handleAddOne() {
    if (product == null) return;
    final cartItem = getIt.get<CartState>().getItem(product!.id);
    if (cartItem == null) return;
    _handleModifyQuantity(cartItem.quantity + 1);
  }
}
