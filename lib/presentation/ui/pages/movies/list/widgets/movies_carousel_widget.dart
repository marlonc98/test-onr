import 'package:flutter/material.dart';
import 'package:test_rappi/domain/entities/movie/movie_entity.dart';
import 'package:test_rappi/presentation/ui/pages/movies/list/widgets/movie_big_card_widget.dart';

class MoviesCarouselWidget extends StatefulWidget {
  final String title;
  final Future<List<MovieEntity>> Function() search;
  const MoviesCarouselWidget(
      {super.key, required this.search, required this.title});

  @override
  State<MoviesCarouselWidget> createState() => _MoviesCarouselWidgetState();
}

class _MoviesCarouselWidgetState extends State<MoviesCarouselWidget> {
  bool loading = true;
  List<MovieEntity> movies = [];
  int _currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    loadMovies();
  }

  void loadMovies() async {
    final result = await widget.search();
    setState(() {
      loading = false;
      movies = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!loading && movies.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox());
    }
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Text(widget.title,
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          if (loading) const CircularProgressIndicator(),
          if (!loading)
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4 + 20,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: movies.length,
                    onPageChanged: (int index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MovieBigCardWidget(movie: movie),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(movies.length, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      width: _currentPage == index ? 12.0 : 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        color:
                            _currentPage == index ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    );
                  }),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
