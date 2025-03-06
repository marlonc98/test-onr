import 'package:either_dart/either.dart';
import 'package:test_rappi/domain/entities/exception_entity.dart';
import 'package:test_rappi/domain/entities/movie/movie_entity.dart';
import 'package:test_rappi/domain/repositories/movie_repository.dart';

class GetPreviewOfMoviesByGenrerUseCase {
  final MovieRepository _movieRepository;
  GetPreviewOfMoviesByGenrerUseCase({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  Future<Either<ExceptionEntity, List<MovieEntity>>> call(int genrerId) =>
      _movieRepository.getMoviesForGender(genderId: genrerId, limit: 5);
}
