import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_onr/domain/entities/product/product_entity.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:test_onr/presentation/ui/pages/shop/product/list/products_list_page_view_model.dart';
import 'package:test_onr/presentation/ui/pages/shop/product/list/widgets/product_card.dart';
import 'package:test_onr/presentation/ui/widgets/custom_bottom_navigation.dart';
import 'package:test_onr/presentation/ui/widgets/error_paginator_widget.dart';
import 'package:test_onr/presentation/ui/widgets/searcher_app_bar.dart';

class ProductsListPage extends StatefulWidget {
  static const String route = '/products';
  const ProductsListPage({super.key});

  @override
  State<ProductsListPage> createState() => _ProductsListPageState();
}

class _ProductsListPageState extends State<ProductsListPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductsListPageViewModel>(
        create: (_) => ProductsListPageViewModel(
            context: context, widget: widget, isMounted: () => mounted),
        child: Consumer<ProductsListPageViewModel>(
            builder: (context, viewModel, child) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SearcherAppBar(
                  title: 'Products',
                  onSearch: viewModel.handleOnChangeQuery,
                ),
                PagedSliverList(
                  pagingController: viewModel.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<ProductEntity>(
                    firstPageErrorIndicatorBuilder: (context) =>
                        ErrorPaginatorWidget(
                      pagingcontroller: viewModel.pagingController,
                    ),
                    itemBuilder: (context, item, index) => Container(
                        margin: const EdgeInsets.only(
                            bottom: 8, left: 16, right: 16),
                        child: ProductCard(product: item)),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
