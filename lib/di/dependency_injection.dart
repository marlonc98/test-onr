import 'package:get_it/get_it.dart';
import 'package:test_rappi/data/repositories/genrer/genrer_repository_dev.dart';
import 'package:test_rappi/data/repositories/genrer/genrer_repository_fake.dart';
import 'package:test_rappi/data/repositories/genrer/genrer_repository_impl.dart';
import 'package:test_rappi/data/repositories/localization/localization_repository_dev.dart';
import 'package:test_rappi/data/repositories/localization/localization_repository_fake.dart';
import 'package:test_rappi/data/repositories/localization/localization_repository_impl.dart';
import 'package:test_rappi/data/repositories/movie/movie_repository_dev.dart';
import 'package:test_rappi/data/repositories/movie/movie_repository_fake.dart';
import 'package:test_rappi/data/repositories/movie/movie_repository_impl.dart';
import 'package:test_rappi/data/settings/host_api.dart';
import 'package:test_rappi/data/settings/rest_api.dart';
import 'package:test_rappi/domain/repositories/genrer_repository.dart';
import 'package:test_rappi/domain/repositories/movie_repository.dart';
import 'package:test_rappi/domain/states/genders_state.dart';
import 'package:test_rappi/domain/states/localization_state.dart';
import 'package:test_rappi/domain/repositories/localization_repository.dart';
import 'package:test_rappi/domain/use_cases/default/load_use_case.dart';
import 'package:test_rappi/domain/use_cases/genrer/get_all_genrers_use_case.dart';
import 'package:test_rappi/domain/use_cases/movie/get_movie_by_id_use_case.dart';
import 'package:test_rappi/domain/use_cases/movie/get_popular_movies_use_case.dart';
import 'package:test_rappi/domain/use_cases/movie/get_preview_of_movies_by_genRer_use_case.dart';
import 'package:test_rappi/domain/use_cases/movie/get_rated_movies_use_case.dart';
import 'package:test_rappi/domain/use_cases/movie/search_movies_use_case.dart';
import 'package:test_rappi/flavors/flavors.dart';
import 'package:test_rappi/presentation/providers/states/genrers_state_impl.dart';
import 'package:test_rappi/presentation/providers/states/localization_state_impl.dart';

enum ModeDependencyInjection { fake, dev, prod }

class DependencyInjection {
  DependencyInjection() {
    GetIt getIt = GetIt.instance;
    Flavor? mode = F.appFlavor;
    //#region ------------- repositories -------------------------//
    if (mode == Flavor.fake) {
      getIt.registerSingleton<LocalizationRepository>(
          LocalizationRepositoryFake());
      getIt.registerSingleton<GenrerRepository>(GenrerRepositoryFake());
      getIt.registerSingleton<MovieRepository>(MovieRepositoryFake());
    } else if (mode == Flavor.dev) {
      getIt.registerSingleton<LocalizationRepository>(
          LocalizationRepositoryDev());
      getIt.registerSingleton<GenrerRepository>(GenrerRepositoryDev());
      getIt.registerSingleton<MovieRepository>(MovieRepositoryDev());
    } else {
      getIt.registerSingleton<LocalizationRepository>(
          LocalizationRepositoryImpl());
      getIt.registerSingleton<GenrerRepository>(GenrerRepositoryImpl());
      getIt.registerSingleton<MovieRepository>(MovieRepositoryImpl());
    }
    //#endregion repositories

    getIt.registerSingleton<RestApi>(HostApi());

    //#region ------------- providers -------------------------//
    getIt.registerSingleton<LocalizationState>(LocalizationStateImpl());
    getIt.registerSingleton<GenrersState>(GenrersStateImpl());
    //#endregion

    //#region ------------- use cases -------------------------//

    //#region genrer
    getIt.registerSingleton<GetAllGenrersUseCase>(GetAllGenrersUseCase(
        genrerRepository: getIt.get<GenrerRepository>(),
        genrersState: getIt.get<GenrersState>()));
    //#endregion

    //#region default
    getIt.registerSingleton<LoadUseCase>(LoadUseCase(
        localizationRepository: getIt.get<LocalizationRepository>(),
        localizationState: getIt.get<LocalizationState>()));
    //#endregion

    //#region movies
    getIt.registerSingleton<GetMovieByIdUseCase>(
        GetMovieByIdUseCase(movieRepository: getIt.get<MovieRepository>()));
    getIt.registerSingleton<GetPopularMoviesUseCase>(
        GetPopularMoviesUseCase(movieRepository: getIt.get<MovieRepository>()));
    getIt.registerSingleton<GetPreviewOfMoviesByGenrerUseCase>(
        GetPreviewOfMoviesByGenrerUseCase(
            movieRepository: getIt.get<MovieRepository>()));
    getIt.registerSingleton<GetRatedMoviesUseCase>(
        GetRatedMoviesUseCase(movieRepository: getIt.get<MovieRepository>()));
    getIt.registerSingleton<SearchMoviesUseCase>(
        SearchMoviesUseCase(movieRepository: getIt.get<MovieRepository>()));

    //#endregion
    //#endregion
  }
}
