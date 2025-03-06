import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_rappi/domain/entities/movie/movie_entity.dart';
import 'package:test_rappi/presentation/ui/pages/movies/list/widgets/movie_small_card_widget.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:test_rappi/presentation/ui/pages/movies/search/search_movies_page_view_model.dart';
import 'package:test_rappi/presentation/ui/widgets/searcher_app_bar.dart';

class SearchMoviesPage extends StatefulWidget {
  static const String route = '/movies/search';
  final String? query;
  const SearchMoviesPage({super.key, this.query});

  @override
  State<SearchMoviesPage> createState() => _SearchMoviesPageState();
}

class _SearchMoviesPageState extends State<SearchMoviesPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchMoviesPageViewModel>(
        create: (_) => SearchMoviesPageViewModel(
            context: context, widget: widget, isMounted: () => mounted),
        child: Consumer<SearchMoviesPageViewModel>(
            builder: (context, viewModel, child) {
          return Scaffold(
              body: CustomScrollView(
            slivers: [
              SearcherAppBar(
                title: 'Movies',
                defaultSearch: widget.query,
                onSearch: viewModel.handleOnChangeQuery,
              ),
              PagedSliverGrid(
                pagingController: viewModel.pagingController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                builderDelegate: PagedChildBuilderDelegate<MovieEntity>(
                  itemBuilder: (context, item, index) => Container(
                      margin:
                          const EdgeInsets.only(bottom: 8, left: 16, right: 16),
                      child: MovieSmallCardWidget(movie: item)),
                ),
              ),
            ],
          ));
        }));
  }
}
