import 'package:get_it/get_it.dart';
import 'package:test_onr/data/repositories/auth/auth_repository_fake.dart';
import 'package:test_onr/data/repositories/cart/cart_repository_impl.dart';
import 'package:test_onr/data/repositories/localization/localization_repository_dev.dart';
import 'package:test_onr/data/repositories/localization/localization_repository_fake.dart';
import 'package:test_onr/data/repositories/localization/localization_repository_impl.dart';
import 'package:test_onr/data/repositories/product/product_repository_dev.dart';
import 'package:test_onr/data/repositories/product/product_repository_fake.dart';
import 'package:test_onr/data/repositories/product/product_repository_impl.dart';
import 'package:test_onr/data/repositories/user/user_repository_dev.dart';
import 'package:test_onr/data/repositories/user/user_repository_fake.dart';
import 'package:test_onr/data/repositories/user/user_repository_impl.dart';
import 'package:test_onr/data/settings/host_api.dart';
import 'package:test_onr/data/settings/rest_api.dart';
import 'package:test_onr/domain/repositories/auth_repository.dart';
import 'package:test_onr/domain/repositories/cart_repository.dart';
import 'package:test_onr/domain/repositories/product_repository.dart';
import 'package:test_onr/domain/repositories/user_repository.dart';
import 'package:test_onr/domain/states/localization_state.dart';
import 'package:test_onr/domain/repositories/localization_repository.dart';
import 'package:test_onr/domain/use_cases/default/load_use_case.dart';
import 'package:test_onr/domain/use_cases/auth/sign_in_use_case.dart';
import 'package:test_onr/domain/use_cases/auth/get_current_user_use_case.dart';
import 'package:test_onr/domain/use_cases/auth/logout_use_case.dart';
import 'package:test_onr/domain/use_cases/cart/add_to_cart_use_case.dart';
import 'package:test_onr/domain/use_cases/cart/remove_from_cart_use_case.dart';
import 'package:test_onr/domain/use_cases/cart/get_cart_use_case.dart';
import 'package:test_onr/domain/use_cases/cart/clear_cart_use_case.dart';
import 'package:test_onr/domain/use_cases/cart/buy_use_case.dart';
import 'package:test_onr/domain/use_cases/product/search_products_use_case.dart';
import 'package:test_onr/domain/use_cases/product/get_product_by_id_use_case.dart';
import 'package:test_onr/domain/use_cases/user/search_users_use_case.dart';
import 'package:test_onr/flavors/flavors.dart';
import 'package:test_onr/presentation/providers/states/localization_state_impl.dart';
import 'package:test_onr/domain/states/user_state.dart';
import 'package:test_onr/domain/states/cart_state.dart';

enum ModeDependencyInjection { fake, dev, prod }

class DependencyInjection {
  DependencyInjection() {
    GetIt getIt = GetIt.instance;
    Flavor? mode = F.appFlavor;
    //#region ------------- repositories -------------------------//
    getIt.registerSingleton<AuthRepository>(AuthRepositoryFake());
    getIt.registerSingleton<CartRepository>(CartRepositoryImpl());
    if (mode == Flavor.fake) {
      getIt.registerSingleton<LocalizationRepository>(
          LocalizationRepositoryFake());
      getIt.registerSingleton<ProductRepository>(ProductRepositoryFake());
      getIt.registerSingleton<UserRepository>(UserRepositoryFake());
    } else if (mode == Flavor.dev) {
      getIt.registerSingleton<LocalizationRepository>(
          LocalizationRepositoryDev());
      getIt.registerSingleton<ProductRepository>(ProductRepositoryDev());
      getIt.registerSingleton<UserRepository>(UserRepositoryDev());
    } else {
      getIt.registerSingleton<LocalizationRepository>(
          LocalizationRepositoryImpl());
      getIt.registerSingleton<ProductRepository>(ProductRepositoryImpl());
      getIt.registerSingleton<UserRepository>(UserRepositoryImpl());
    }
    //#endregion repositories

    getIt.registerSingleton<RestApi>(HostApi());

    //#region ------------- providers -------------------------//
    getIt.registerSingleton<LocalizationState>(LocalizationStateImpl());
    // getIt.registerSingleton<UserState>(UserState());
    // getIt.registerSingleton<CartState>(CartState());
    //#endregion

    //#region ------------- use cases -------------------------//

    //#region default
    getIt.registerSingleton<LoadUseCase>(LoadUseCase(
        localizationRepository: getIt.get<LocalizationRepository>(),
        localizationState: getIt.get<LocalizationState>()));
    //#endregion

    //#region auth
    getIt.registerSingleton<SignInUseCase>(SignInUseCase(
        authRepository: getIt.get<AuthRepository>(),
        userState: getIt.get<UserState>()));
    getIt.registerSingleton<GetCurrentUserUseCase>(GetCurrentUserUseCase(
        authRepository: getIt.get<AuthRepository>(),
        userState: getIt.get<UserState>()));
    getIt.registerSingleton<LogoutUseCase>(LogoutUseCase(
        authRepository: getIt.get<AuthRepository>(),
        userState: getIt.get<UserState>()));
    //#endregion

    //#region cart
    getIt.registerSingleton<AddToCartUseCase>(AddToCartUseCase(
        cartRepository: getIt.get<CartRepository>(),
        cartState: getIt.get<CartState>()));
    getIt.registerSingleton<RemoveFromCartUseCase>(RemoveFromCartUseCase(
        cartRepository: getIt.get<CartRepository>(),
        cartState: getIt.get<CartState>()));
    getIt.registerSingleton<GetCartUseCase>(GetCartUseCase(
        cartRepository: getIt.get<CartRepository>(),
        cartState: getIt.get<CartState>()));
    getIt.registerSingleton<ClearCartUseCase>(ClearCartUseCase(
        cartRepository: getIt.get<CartRepository>(),
        cartState: getIt.get<CartState>()));
    getIt.registerSingleton<BuyUseCase>(BuyUseCase(
        cartRepository: getIt.get<CartRepository>(),
        cartState: getIt.get<CartState>()));
    //#endregion

    //#region product
    getIt.registerSingleton<SearchProductsUseCase>(SearchProductsUseCase(
        productRepository: getIt.get<ProductRepository>()));
    getIt.registerSingleton<GetProductByIdUseCase>(GetProductByIdUseCase(
        productRepository: getIt.get<ProductRepository>()));
    //#endregion

    //#region user
    getIt.registerSingleton<SearchUsersUseCase>(
        SearchUsersUseCase(userRepository: getIt.get<UserRepository>()));
    //#endregion
    //#endregion
  }
}
