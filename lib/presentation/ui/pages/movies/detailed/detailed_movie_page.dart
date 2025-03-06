import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_rappi/presentation/ui/pages/movies/detailed/detailed_movie_page_view_model.dart';
import 'package:test_rappi/presentation/ui/widgets/calification_widget.dart';
import 'package:test_rappi/presentation/ui/widgets/not_found_widget.dart';

class DetailedMoviePage extends StatefulWidget {
  static const String route = '/movies/detailed';

  final int id;
  const DetailedMoviePage({super.key, required this.id});

  @override
  State<DetailedMoviePage> createState() => _DetailedMoviePageState();
}

class _DetailedMoviePageState extends State<DetailedMoviePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailedMoviePageViewModel>(
        create: (_) => DetailedMoviePageViewModel(
            context: context, widget: widget, isMounted: () => mounted),
        child: Consumer<DetailedMoviePageViewModel>(
            builder: (context, viewModel, child) {
          if (viewModel.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (viewModel.movie == null) {
            return const NotFoundWidget();
          }
          return Scaffold(
              body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 400.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(viewModel.movie?.title ?? ''),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        viewModel.movie?.posterPath ?? '',
                        fit: BoxFit.cover,
                      ),
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black54,
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Row(
                    children: [
                      const SizedBox(width: 16),
                      CalificationWidget(
                          size: 40, rating: viewModel.movie!.voteAverage),
                      const SizedBox(width: 16),
                      Expanded(
                          child: Wrap(
                        alignment: WrapAlignment.end,
                        children: viewModel.movie!.genrers
                            .map((e) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Chip(label: Text(e.name)),
                                ))
                            .toList(),
                      )),
                    ],
                  ),
                  ListTile(
                    title: const Text("Overview"),
                    subtitle: Text(viewModel.movie?.overview ?? ''),
                  ),
                  ListTile(
                    title: const Text("Release date"),
                    subtitle: Container(
                        alignment: Alignment.centerLeft,
                        child: Chip(
                            label: Text(viewModel.movie?.releaseDate ?? ''))),
                  ),
                  ListTile(
                      title: const Text("Original language"),
                      subtitle: Container(
                        alignment: Alignment.centerLeft,
                        child: Chip(
                            label:
                                Text(viewModel.movie?.originalLanguage ?? '')),
                      )),
                  ListTile(
                    title: const Text("Original title"),
                    subtitle: Container(
                      alignment: Alignment.centerLeft,
                      child: Chip(
                          label: Text(
                              viewModel.movie?.originalTitle.toString() ?? '')),
                    ),
                  ),
                ]),
              ),
            ],
          ));
        }));
  }
}
