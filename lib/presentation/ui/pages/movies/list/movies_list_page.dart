import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_rappi/domain/entities/genrer/genrer_entity.dart';
import 'package:test_rappi/presentation/ui/pages/movies/list/movies_list_page_view_model.dart';
import 'package:test_rappi/presentation/ui/pages/movies/list/widgets/movies_carousel_widget.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:test_rappi/presentation/ui/pages/movies/list/widgets/movies_small_carousel.dart';
import 'package:test_rappi/presentation/ui/widgets/error_paginator_widget.dart';
import 'package:test_rappi/presentation/ui/widgets/searcher_app_bar.dart';

class MoviesListPage extends StatefulWidget {
  static const String route = '/movies';
  const MoviesListPage({super.key});

  @override
  State<MoviesListPage> createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MoviesListPageViewModel>(
        create: (_) => MoviesListPageViewModel(
            context: context, widget: widget, isMounted: () => mounted),
        child: Consumer<MoviesListPageViewModel>(
            builder: (context, viewModel, child) {
          return Scaffold(
              body: CustomScrollView(
            slivers: [
              SearcherAppBar(
                title: 'Movies',
                onSearch: viewModel.handleSearch,
                waitSearch: true,
              ),
              MoviesCarouselWidget(
                search: viewModel.getPopularMovies,
                title: "Popular Movies",
              ),
              MoviesCarouselWidget(
                search: viewModel.getRatedMovies,
                title: "Top Rated Movies",
              ),
              PagedSliverList<int, GenrerEntity>(
                pagingController: viewModel.pagingController,
                builderDelegate: PagedChildBuilderDelegate<GenrerEntity>(
                  firstPageErrorIndicatorBuilder: (context) =>
                      ErrorPaginatorWidget(
                          onRetry: viewModel.retry,
                          pagingController: viewModel.pagingController),
                  itemBuilder: (context, item, index) => Container(
                      margin:
                          const EdgeInsets.only(bottom: 8, left: 16, right: 16),
                      child: MoviesSmallCarousel(
                        search: () => viewModel.getGenrerMovies(item.id),
                        title: item.name,
                      )),
                ),
              ),
            ],
          ));
        }));
  }
}
