import 'package:either_dart/either.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:test_rappi/domain/entities/exception_entity.dart';
import 'package:test_rappi/domain/entities/movie/movie_entity.dart';
import 'package:test_rappi/domain/entities/search_result_entity.dart';
import 'package:test_rappi/domain/use_cases/movie/search_movies_use_case.dart';
import 'package:test_rappi/presentation/ui/pages/view_model.dart';
import 'package:test_rappi/utils/show_modal.dart';

class SearchMoviesPageViewModel extends ViewModel {
  SearchMoviesPageViewModel(
      {required super.context,
      required super.widget,
      required super.isMounted}) {
    _initPaginController();
  }

  PagingController<int, MovieEntity> pagingController =
      PagingController(firstPageKey: 1);

  String searching = "";
  int page = 1;
  final int _itemsPerPage = 10;
  List<MovieEntity> movies = [];

  void _initPaginController() {
    searching = widget.query ?? "";
    pagingController.addPageRequestListener((pageKey) {
      page = pageKey;
      _searchMovies();
    });
  }

  void handleOnChangeQuery(String value) {
    searching = value;
    page = 1;
    movies.clear();
    _searchMovies();
  }

  void _searchMovies() async {
    Either<ExceptionEntity, SearchResultEntity<MovieEntity>> response =
        await getIt.get<SearchMoviesUseCase>().call(
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
