import 'package:test_rappi/domain/entities/movie/movie_entity.dart';
import 'package:test_rappi/domain/use_cases/movie/get_movie_by_id_use_case.dart';
import 'package:test_rappi/presentation/ui/pages/view_model.dart';
import 'package:test_rappi/utils/show_modal.dart';

class DetailedMoviePageViewModel extends ViewModel {
  DetailedMoviePageViewModel(
      {required super.context,
      required super.widget,
      required super.isMounted}) {
    _getMovie();
  }

  MovieEntity? movie;
  bool loading = true;

  void _getMovie() async {
    final result = await getIt.get<GetMovieByIdUseCase>().call(widget.id);
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
      movie = result.right;
      loading = false;
      notifyListeners();
    }
  }
}
