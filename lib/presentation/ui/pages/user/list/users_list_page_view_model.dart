import 'package:either_dart/either.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/user/user_entity.dart';
import 'package:test_onr/domain/entities/search_result_entity.dart';
import 'package:test_onr/domain/use_cases/user/search_users_use_case.dart';
import 'package:test_onr/presentation/ui/pages/user/list/users_list_page.dart';
import 'package:test_onr/presentation/ui/pages/view_model.dart';
import 'package:test_onr/utils/show_modal.dart';

class UsersListPageViewModel extends ViewModel<UsersListPage> {
  UsersListPageViewModel(
      {required super.context,
      required super.widget,
      required super.isMounted}) {
    _initPaginController();
  }
  PagingController<int, UserEntity> pagingController =
      PagingController(firstPageKey: 1);

  String searching = "";
  int page = 1;
  final int _itemsPerPage = 10;
  List<UserEntity> users = [];

  void _initPaginController() {
    pagingController.addPageRequestListener((pageKey) {
      page = pageKey;
      _searchUsers();
    });
  }

  void handleOnChangeQuery(String value) {
    searching = value;
    page = 1;
    users.clear();
    _searchUsers();
  }

  void _searchUsers() async {
    Either<ExceptionEntity, SearchResultEntity<UserEntity>> response =
        await getIt.get<SearchUsersUseCase>().call(
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
    if (mounted) {
      // Show total of users
      ShowModal.showSnackBar(
        // ignore: use_build_context_synchronously
        context: context,
        text: "Total users: ${response.right.data.length}",
      );
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
