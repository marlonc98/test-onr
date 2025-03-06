import 'package:flutter/material.dart';
import 'package:test_rappi/domain/entities/movie/movie_entity.dart';
import 'package:test_rappi/presentation/ui/pages/movies/detailed/detailed_movie_page.dart';
import 'package:test_rappi/presentation/ui/widgets/image_network_with_load_widget.dart';

class MovieSmallCardWidget extends StatelessWidget {
  final MovieEntity movie;
  const MovieSmallCardWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(DetailedMoviePage.route,
          arguments: DetailedMoviePage(id: movie.id)),
      child: Container(
        width: 200,
        height: 150,
        padding: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              ImageNetworkWithLoadWidget(
                movie.posterPath,
                width: 200,
                height: 150,
                fit: BoxFit.cover,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withAlpha(200),
                    ],
                  ),
                ),
                child: Text(
                  movie.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
