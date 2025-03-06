import 'package:either_dart/either.dart';
import 'package:test_rappi/domain/entities/exception_entity.dart';
import 'package:test_rappi/domain/entities/movie/movie_entity.dart';
import 'package:test_rappi/domain/repositories/movie_repository.dart';

class GetMovieByIdUseCase {
  final MovieRepository _movieRepository;
  GetMovieByIdUseCase({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  Future<Either<ExceptionEntity, MovieEntity>> call(int id) =>
      _movieRepository.getMovieById(id);
}
