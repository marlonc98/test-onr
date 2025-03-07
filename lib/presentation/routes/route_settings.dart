import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_onr/presentation/ui/pages/auth/login/login_page.dart';
import 'package:test_onr/presentation/ui/pages/auth/settings/settings_page.dart';
import 'package:test_onr/presentation/ui/pages/cart/cart_page.dart';
import 'package:test_onr/presentation/ui/pages/shop/product/list/products_list_page.dart';
import 'package:test_onr/presentation/ui/pages/splash/splash_page.dart';
import 'package:test_onr/presentation/ui/pages/user/list/users_list_page.dart';
import 'package:test_onr/presentation/ui/pages/shop/product/detailed/detailed_product_page.dart';
import 'package:test_onr/domain/states/user_state.dart';
import 'package:provider/provider.dart';
import 'package:test_onr/presentation/ui/widgets/custom_bottom_navigation.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter routerSetting = GoRouter(
  initialLocation: SplashPage.route,
  routes: [
    GoRoute(
      path: SplashPage.route,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: LoginPage.route,
      builder: (context, state) => const LoginPage(),
      redirect: (context, state) {
        final userState = Provider.of<UserState>(context, listen: false);
        return userState.user != null ? ProductsListPage.route : null;
      },
    ),
    GoRoute(
      path: SettingsPage.route,
      builder: (context, state) => const SettingsPage(),
      redirect: (context, state) {
        final userState = Provider.of<UserState>(context, listen: false);
        return userState.user == null ? LoginPage.route : null;
      },
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: CustomBottomNavigation(
            context: context,
            currentRoute: state.uri.toString(),
          ),
        );
      },
      routes: [
        GoRoute(
          path: ProductsListPage.route,
          builder: (context, state) => const ProductsListPage(),
          routes: [
            GoRoute(
              path: DetailedProductPage.route,
              parentNavigatorKey:
                  _shellNavigatorKey, // Usa el mismo Navigator del Shell
              builder: (context, state) {
                final id = int.parse(state.pathParameters['id']!);
                return DetailedProductPage(id: id);
              },
            ),
          ],
        ),
        GoRoute(
          path: UsersListPage.route,
          builder: (context, state) => const UsersListPage(),
        ),
      ],
    ),
    GoRoute(
      path: CartPage.route,
      builder: (context, state) => const CartPage(),
    ),
  ],
);
