import 'package:either_dart/either.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/product/product_entity.dart';
import 'package:test_onr/domain/entities/search_result_entity.dart';
import 'package:test_onr/domain/use_cases/product/search_products_use_case.dart';
import 'package:test_onr/presentation/ui/pages/shop/product/list/products_list_page.dart';
import 'package:test_onr/presentation/ui/pages/view_model.dart';
import 'package:test_onr/utils/show_modal.dart';

class ProductsListPageViewModel extends ViewModel<ProductsListPage> {
  ProductsListPageViewModel(
      {required super.context,
      required super.widget,
      required super.isMounted}) {
    _initPaginController();
  }
  PagingController<int, ProductEntity> pagingController =
      PagingController(firstPageKey: 1);

  String searching = "";
  int page = 1;
  final int _itemsPerPage = 10;
  List<ProductEntity> products = [];

  void _initPaginController() {
    pagingController.addPageRequestListener((pageKey) {
      page = pageKey;
      _searchProducts();
    });
  }

  void handleOnChangeQuery(String value) {
    searching = value;
    page = 1;
    products.clear();
    _searchProducts();
  }

  void _searchProducts() async {
    Either<ExceptionEntity, SearchResultEntity<ProductEntity>> response =
        await getIt.get<SearchProductsUseCase>().call(
              itemsPerPage: _itemsPerPage,
              query: searching,
              page: page,
            );

    if (response.isLeft) {
      ShowModal.showSnackBar(
          // ignore: use_build_context_synchronously
          context: context,
          text: localization.translate(response.left.code),
          error: true);
      return;
    }
    if (page == 1) pagingController.itemList = [];
    if (response.right.data.isNotEmpty) {
      if (response.right.data.length < _itemsPerPage) {
        pagingController.appendLastPage(response.right.data);
      } else {
        final nextPageKey = page + 1;
        pagingController.appendPage(response.right.data, nextPageKey);
      }
    } else {
      pagingController.appendLastPage(response.right.data);
    }
  }
}
