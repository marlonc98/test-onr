import 'package:flutter/material.dart';
import 'package:test_onr/presentation/ui/pages/auth/settings/settings_page.dart';
import 'package:test_onr/presentation/ui/pages/cart/cart_page.dart';
import 'package:test_onr/presentation/ui/pages/shop/product/list/products_list_page.dart';
import 'package:test_onr/presentation/ui/pages/user/list/users_list_page.dart';

class CustomBottomNavigation extends StatelessWidget {
  final String? currentRoute;
  final BuildContext context;

  CustomBottomNavigation({super.key, this.currentRoute, required this.context});

  final List<RouteHome> routes = [
    RouteHome(
      route: ProductsListPage.route,
      icon: Icons.search,
      label: 'Products',
    ),
    RouteHome(
      route: CartPage.route,
      icon: Icons.shopping_cart,
      label: 'Cart',
    ),
    RouteHome(
      route: UsersListPage.route,
      icon: Icons.person,
      label: 'Users',
    ),
    RouteHome(
      route: SettingsPage.route,
      icon: Icons.settings,
      label: 'Settings',
    ),
  ];

  int? getIndex() {
    if (currentRoute == null) return null;
    return routes.indexWhere((route) => route.route == currentRoute);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).bottomAppBarTheme.color,
      elevation: 16,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        if (index != getIndex()) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            routes[index].route,
            (route) => false,
          );
        }
      },
      currentIndex: getIndex() ?? 0,
      selectedLabelStyle: TextStyle(
        color:
            getIndex() == null ? Colors.grey : (Theme.of(context).primaryColor),
      ),
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: const TextStyle(color: Colors.grey),
      selectedItemColor:
          getIndex() == null ? Colors.grey : (Theme.of(context).primaryColor),
      items: routes
          .map(
            (e) => BottomNavigationBarItem(
              icon: Icon(e.icon, size: 25),
              label: e.label,
            ),
          )
          .toList(),
    );
  }
}

class RouteHome {
  final String route;
  final IconData icon;
  final String label;

  RouteHome({required this.route, required this.icon, required this.label});
}
