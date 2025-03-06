import 'package:either_dart/either.dart';
import 'package:test_rappi/domain/entities/exception_entity.dart';
import 'package:test_rappi/domain/entities/genrer/genrer_entity.dart';
import 'package:test_rappi/domain/entities/movie/movie_entity.dart';
import 'package:test_rappi/domain/entities/search_result_entity.dart';
import 'package:test_rappi/domain/repositories/movie_repository.dart';

MovieEntity movieMock = const MovieEntity(
  id: 1,
  title: 'Guy',
  overview:
      '‘Ley y Orden: Unidad de Víctimas Especiales’ es una serie de televisión estadounidense grabada en Nueva York donde es también principalmente producida. Con el estilo de la original ‘Ley y Orden’ los episodios son usualmente "sacados de los titulares" o basados libremente en verdaderos asesinatos que han recibido la atención de los medios.',
  releaseDate: 'releaseDate',
  posterPath: 'https://image.tmdb.org/t/p/w500/8Y43POKjjKDGI9MH89NW0NAzzp8.jpg',
  voteAverage: 74,
  originalLanguage: 'en',
  originalTitle: 'Guy',
  genrers: [
    GenrerEntity(id: 1, name: 'Action'),
    GenrerEntity(id: 2, name: 'Adventure'),
  ],
);

MovieEntity movieMock2 = const MovieEntity(
  id: 939243,
  title: 'Sonic el erizo',
  overview:
      '‘Ley y Orden: Unidad de Víctimas Especiales’ es una serie de televisión estadounidense grabada en Nueva York donde es también principalmente producida. Con el estilo de la original ‘Ley y Orden’ los episodios son usualmente "sacados de los titulares" o basados libremente en verdaderos asesinatos que han recibido la atención de los medios.',
  releaseDate: 'releaseDate2',
  originalLanguage: 'en',
  originalTitle: 'Sonic',
  posterPath:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5UG2mFZ_N5omNq4sxQXPjCQ3nXXP5bikjCA&s',
  voteAverage: 98,
  genrers: [
    GenrerEntity(id: 1, name: 'Action'),
    GenrerEntity(id: 2, name: 'Adventure'),
  ],
);

class MovieRepositoryFake extends MovieRepository {
  @override
  Future<Either<ExceptionEntity, MovieEntity>> getMovieById(int id) async {
    await Future.delayed(const Duration(seconds: 1));
    return Right(movieMock);
  }

  @override
  Future<Either<ExceptionEntity, SearchResultEntity<MovieEntity>>> serchMovies(
      {required int page, required String query, required int itemsPerPage}) {
    int limitpage = 3;
    if (page <= limitpage) {
      return Future.delayed(const Duration(seconds: 1), () {
        return Right(SearchResultEntity(
          currentPage: page,
          totalItems: limitpage * itemsPerPage,
          data: List.generate(
              itemsPerPage, (index) => index % 2 == 0 ? movieMock : movieMock2),
          itemsPerPage: itemsPerPage,
          lastpage: limitpage,
        ));
      });
    } else {
      return Future.delayed(const Duration(seconds: 1), () {
        return Right(SearchResultEntity(
          currentPage: page,
          totalItems: limitpage * itemsPerPage,
          data: [],
          itemsPerPage: itemsPerPage,
          lastpage: limitpage,
        ));
      });
    }
  }

  @override
  Future<Either<ExceptionEntity, List<MovieEntity>>> getMoviesForGender(
      {required int genderId, required int limit}) async {
    await Future.delayed(const Duration(seconds: 1));
    return Right(List.generate(
        limit, (index) => index % 2 == 0 ? movieMock : movieMock2));
  }

  @override
  Future<Either<ExceptionEntity, List<MovieEntity>>> getPopularMovies() async {
    await Future.delayed(const Duration(seconds: 1));
    return Right(
        List.generate(10, (index) => index % 2 == 0 ? movieMock : movieMock2));
  }

  @override
  Future<Either<ExceptionEntity, List<MovieEntity>>> getTopRatedMovies() async {
    await Future.delayed(const Duration(seconds: 1));
    return Right(
        List.generate(10, (index) => index % 2 == 0 ? movieMock : movieMock2));
  }
}
