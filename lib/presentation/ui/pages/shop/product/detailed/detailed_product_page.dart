import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_onr/domain/states/cart_state.dart';
import 'package:test_onr/presentation/ui/pages/shop/product/detailed/detailed_product_page_view_model.dart';
import 'package:test_onr/presentation/ui/widgets/image_network_with_load_widget.dart';
import 'package:test_onr/presentation/ui/widgets/not_found_widget.dart';

class DetailedProductPage extends StatefulWidget {
  static const String route = '/product-detailed/:id';
  static const String fullRoute = '/products/product-detailed';

  final int id;
  const DetailedProductPage({super.key, required this.id});

  @override
  State<DetailedProductPage> createState() => _DetailedProductPageState();
}

class _DetailedProductPageState extends State<DetailedProductPage> {
  @override
  Widget build(BuildContext context) {
    final cartState = Provider.of<CartState>(context);
    final cartItem = cartState.getItem(widget.id);
    return ChangeNotifierProvider<DetailedProductPageViewModel>(
      create: (_) => DetailedProductPageViewModel(
          context: context, widget: widget, isMounted: () => mounted),
      child: Consumer<DetailedProductPageViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.loading) {
            return Scaffold(
              appBar: AppBar(),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (viewModel.product == null) {
            return Scaffold(appBar: AppBar(), body: const NotFoundWidget());
          }
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        expandedHeight: 400.0,
                        floating: false,
                        pinned: true,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(
                                color: Colors.white,
                                padding:
                                    const EdgeInsets.only(top: 100, bottom: 16),
                                child: ImageNetworkWithLoadWidget(
                                  viewModel.product?.imageUrl ?? '',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black54,
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate([
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  viewModel.product?.title ?? '',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  viewModel.product?.description ?? '',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(Icons.star, color: Colors.amber),
                                    Text(
                                      '${viewModel.product?.rating ?? 0.0} (${viewModel.product?.rankingCount ?? 0} reviews)',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, bottom: 24, top: 16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, -5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${viewModel.product?.price ?? 0.0}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        cartItem != null && cartItem.quantity > 0
                            ? Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: viewModel.handleLessOne,
                                  ),
                                  Text('${cartItem.quantity}'),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: viewModel.handleAddOne,
                                  ),
                                ],
                              )
                            : ElevatedButton(
                                onPressed: viewModel.handleAddToCart,
                                child: const Text('Add to Cart'),
                              ),
                      ],
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
