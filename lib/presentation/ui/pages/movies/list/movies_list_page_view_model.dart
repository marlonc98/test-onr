import 'package:either_dart/either.dart';
import 'package:flutter/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:test_rappi/domain/entities/exception_entity.dart';
import 'package:test_rappi/domain/entities/genrer/genrer_entity.dart';
import 'package:test_rappi/domain/entities/movie/movie_entity.dart';
import 'package:test_rappi/domain/use_cases/genrer/get_all_genrers_use_case.dart';
import 'package:test_rappi/domain/use_cases/movie/get_popular_movies_use_case.dart';
import 'package:test_rappi/domain/use_cases/movie/get_preview_of_movies_by_genRer_use_case.dart';
import 'package:test_rappi/domain/use_cases/movie/get_rated_movies_use_case.dart';
import 'package:test_rappi/presentation/ui/pages/movies/list/movies_list_page.dart';
import 'package:test_rappi/presentation/ui/pages/movies/search/search_movies_page.dart';
import 'package:test_rappi/presentation/ui/pages/view_model.dart';
import 'package:test_rappi/utils/key_words_constants.dart';
import 'package:test_rappi/utils/show_modal.dart';

class MoviesListPageViewModel extends ViewModel<MoviesListPage> {
  MoviesListPageViewModel(
      {required super.context,
      required super.widget,
      required super.isMounted}) {
    _initPaginController();
  }

  void retry() {
    getPopularMovies();
    getRatedMovies();
    notifyListeners();
  }

  PagingController<int, GenrerEntity> pagingController =
      PagingController(firstPageKey: 1);
  int page = 1;
  final _itemsPerPage = 3;

  void _initPaginController() {
    pagingController.addPageRequestListener((pageKey) {
      page = pageKey;
      _getGenrers();
    });
  }

  Future<List<MovieEntity>> getPopularMovies() async {
    Either<ExceptionEntity, List<MovieEntity>> result =
        await getIt.get<GetPopularMoviesUseCase>().call();
    if (result.isLeft) {
      if (result.left.code == KeyWordsConstants.noInternetConnection) {
        pagingController.error = localization.translate(result.left.code);
        notifyListeners();
      }
      if (mounted) {
        ShowModal.showSnackBar(
            // ignore: use_build_context_synchronously
            context: context,
            text: result.left.code,
            error: true);
      }
      return [];
    } else {
      return result.right;
    }
  }

  void _getGenrers() async {
    List<GenrerEntity> genrers =
        await getIt.get<GetAllGenrersUseCase>().call(false);
    if (_itemsPerPage * (page - 1) < genrers.length &&
        _itemsPerPage * page < genrers.length) {
      //just append as paginator from item 1 of page x to item itemsperpage
      List<GenrerEntity> genrersPage =
          genrers.skip(_itemsPerPage * (page - 1)).take(_itemsPerPage).toList();
      pagingController.appendPage(genrersPage, page + 1);
    } else if (_itemsPerPage * (page - 1) < genrers.length &&
        _itemsPerPage * page >= genrers.length) {
      pagingController.appendLastPage(genrers);
    }
  }

  Future<List<MovieEntity>> getGenrerMovies(int id) async {
    Either<ExceptionEntity, List<MovieEntity>> result =
        await getIt.get<GetPreviewOfMoviesByGenrerUseCase>().call(id);
    if (result.isLeft) {
      if (mounted) {
        ShowModal.showSnackBar(
            // ignore: use_build_context_synchronously
            context: context,
            text: result.left.code,
            error: true);
      }
      return [];
    } else {
      return result.right;
    }
  }

  Future<List<MovieEntity>> getRatedMovies() async {
    Either<ExceptionEntity, List<MovieEntity>> result =
        await getIt.get<GetRatedMoviesUseCase>().call();
    if (result.isLeft) {
      if (mounted) {
        ShowModal.showSnackBar(
            // ignore: use_build_context_synchronously
            context: context,
            text: result.left.code,
            error: true);
      }
      return [];
    } else {
      return result.right;
    }
  }

  Future<void> handleSearch(String word) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamed(SearchMoviesPage.route,
          arguments: SearchMoviesPage(
            query: word,
          ));
    }
  }
}
