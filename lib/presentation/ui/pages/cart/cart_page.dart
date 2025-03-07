import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_onr/domain/states/cart_state.dart';
import 'package:test_onr/presentation/ui/pages/cart/cart_page_view_model.dart';
import 'package:test_onr/presentation/ui/widgets/custom_bottom_navigation.dart';
import 'package:test_onr/presentation/ui/widgets/not_found_widget.dart';

class CartPage extends StatefulWidget {
  static const String route = '/cart';

  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartPageViewModel>(
      create: (_) => CartPageViewModel(
          context: context, isMounted: () => mounted, widget: widget),
      child: Consumer<CartPageViewModel>(
        builder: (context, viewModel, child) {
          final cartState = Provider.of<CartState>(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Cart'),
            ),
            body: viewModel.loading && cartState.items.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : cartState.items.isEmpty
                    ? const NotFoundWidget()
                    : CustomScrollView(
                        slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                final cartItem = cartState.items[index];
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(cartItem.product.imageUrl),
                                  ),
                                  title: Text(cartItem.product.title),
                                  subtitle:
                                      Text('Quantity: ${cartItem.quantity}'),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      viewModel.removeItem(cartItem.product);
                                    },
                                  ),
                                );
                              },
                              childCount: cartState.items.length,
                            ),
                          ),
                        ],
                      ),
            bottomNavigationBar: CustomBottomNavigation(
                context: context, currentRoute: CartPage.route),
          );
        },
      ),
    );
  }
}
