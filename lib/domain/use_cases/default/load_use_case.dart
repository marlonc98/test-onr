import 'package:get_it/get_it.dart';
import 'package:test_rappi/domain/repositories/localization_repository.dart';
import 'package:test_rappi/domain/states/localization_state.dart';
import 'package:test_rappi/domain/use_cases/genrer/get_all_genrers_use_case.dart';

class LoadUseCase {
  final LocalizationRepository localizationRepository;
  final LocalizationState localizationState;

  LoadUseCase({
    required this.localizationState,
    required this.localizationRepository,
  });

  Future<void> _getLanguage() async {
    final locale = await localizationRepository.getLanguage();
    localizationState.locale = locale;
  }

  Future<void> _getGenrers() async {
    GetIt.I.get<GetAllGenrersUseCase>().call(true);
  }

  Future<void> call() async {
    Future.wait([_getLanguage(), _getGenrers()]);
  }
}
