import 'package:test_onr/domain/repositories/localization_repository.dart';
import 'package:test_onr/domain/states/localization_state.dart';

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

  Future<void> call() async {
    Future.wait([_getLanguage()]);
  }
}
