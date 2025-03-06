import 'package:flutter/material.dart';
import 'package:test_rappi/domain/entities/movie/movie_entity.dart';
import 'package:test_rappi/presentation/ui/pages/movies/list/widgets/movie_small_card_widget.dart';

class MoviesSmallCarousel extends StatefulWidget {
  final String title;
  final Future<List<MovieEntity>> Function() search;
  const MoviesSmallCarousel(
      {super.key, required this.search, required this.title});

  @override
  State<MoviesSmallCarousel> createState() => _MoviesCarouselWidgetState();
}

class _MoviesCarouselWidgetState extends State<MoviesSmallCarousel> {
  bool loading = true;
  List<MovieEntity> movies = [];

  @override
  void initState() {
    if (movies.isEmpty) {
      loadMovies();
    }
    super.initState();
  }

  void loadMovies() async {
    final result = await widget.search();
    if (mounted) {
      setState(() {
        loading = false;
        movies = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!loading && movies.isEmpty) {
      return const SizedBox();
    }
    return Column(
      children: [
        Text(widget.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        if (loading) const CircularProgressIndicator(),
        if (!loading)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: movies
                  .map((movie) => MovieSmallCardWidget(movie: movie))
                  .toList(),
            ),
          ),
      ],
    );
  }
}
