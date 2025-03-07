import 'package:get_it/get_it.dart';
import 'package:test_onr/domain/repositories/localization_repository.dart';
import 'package:test_onr/domain/states/localization_state.dart';
import 'package:test_onr/domain/use_cases/auth/get_current_user_use_case.dart';

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

  Future<void> _getCurrentUser() async {
    print("call _getCurrentUser");
    await GetIt.I.get<GetCurrentUserUseCase>().call();
  }

  Future<void> call() async {
    Future.wait([_getLanguage(), _getCurrentUser()]);
  }
}
