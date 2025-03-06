import 'package:either_dart/either.dart';
import 'package:test_rappi/domain/entities/exception_entity.dart';
import 'package:test_rappi/domain/entities/movie/movie_entity.dart';
import 'package:test_rappi/domain/repositories/movie_repository.dart';

class GetPopularMoviesUseCase {
  final MovieRepository _movieRepository;

  GetPopularMoviesUseCase({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  Future<Either<ExceptionEntity, List<MovieEntity>>> call() async {
    return await _movieRepository.getPopularMovies();
  }
}
