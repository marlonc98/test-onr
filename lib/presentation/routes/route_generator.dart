import 'package:flutter/material.dart';
import 'package:test_rappi/presentation/ui/pages/movies/detailed/detailed_movie_page.dart';
import 'package:test_rappi/presentation/ui/pages/movies/list/movies_list_page.dart';
import 'package:test_rappi/presentation/ui/pages/movies/search/search_movies_page.dart';
import 'package:test_rappi/presentation/ui/pages/splah/splash_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case SplashPage.route:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case MoviesListPage.route:
        return MaterialPageRoute(builder: (_) => const MoviesListPage());
      case SearchMoviesPage.route:
        SearchMoviesPage? args2 = args as SearchMoviesPage?;
        return MaterialPageRoute(
            builder: (_) => args2 ?? const SearchMoviesPage());
      case DetailedMoviePage.route:
        DetailedMoviePage args2 = args as DetailedMoviePage;
        return MaterialPageRoute(builder: (_) => args2);
      default:
        return MaterialPageRoute(builder: (_) => const SplashPage());
    }
  }
}
