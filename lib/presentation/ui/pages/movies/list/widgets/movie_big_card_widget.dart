import 'package:flutter/material.dart';
import 'package:test_rappi/domain/entities/movie/movie_entity.dart';
import 'package:test_rappi/presentation/ui/pages/movies/detailed/detailed_movie_page.dart';
import 'package:test_rappi/presentation/ui/widgets/calification_widget.dart';
import 'package:test_rappi/presentation/ui/widgets/image_network_with_load_widget.dart';

class MovieBigCardWidget extends StatelessWidget {
  final MovieEntity movie;
  const MovieBigCardWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(DetailedMoviePage.route,
          arguments: DetailedMoviePage(id: movie.id)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: ImageNetworkWithLoadWidget(
              movie.posterPath,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
            ),
          ),
          Container(
            alignment: Alignment.center,
            transform: Matrix4.translationValues(
                0, -30, 0), // Mueve el widget hacia arriba
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: CalificationWidget(
                    size: 60,
                    rating: movie.voteAverage,
                  ),
                ),
                Text(
                  movie.title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(movie.releaseDate),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
