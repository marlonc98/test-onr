import 'package:flutter/material.dart';
import 'package:test_onr/presentation/ui/pages/auth/login/login_page.dart';
import 'package:test_onr/presentation/ui/pages/auth/settings/settings_page.dart';
import 'package:test_onr/presentation/ui/pages/cart/cart_page.dart';
import 'package:test_onr/presentation/ui/pages/shop/product/detailed/detailed_product_page.dart';
import 'package:test_onr/presentation/ui/pages/shop/product/list/products_list_page.dart';
import 'package:test_onr/presentation/ui/pages/splash/splash_page.dart';
import 'package:test_onr/presentation/ui/pages/user/list/users_list_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case ProductsListPage.route:
        return MaterialPageRoute(builder: (_) => const ProductsListPage());
      case SplashPage.route:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case DetailedProductPage.route:
        DetailedProductPage? arg = args as DetailedProductPage;
        return MaterialPageRoute(builder: (_) => arg);
      case CartPage.route:
        return MaterialPageRoute(builder: (_) => const CartPage());
      case UsersListPage.route:
        return MaterialPageRoute(builder: (_) => const UsersListPage());
      case LoginPage.route:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case SettingsPage.route:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      default:
        return MaterialPageRoute(builder: (_) => const SplashPage());

      // return MaterialPageRoute(builder: (_) => const ProductsListPage());
    }
  }
}
