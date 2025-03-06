import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:test_rappi/data/settings/rest_api.dart';
import 'package:test_rappi/domain/entities/genrer/genrer_entity.dart';

Future<List<GenrerEntity>> getAllGenresApiImpl() async {
  try {
    String relativeUrl = 'genre/movie/list';
    String? response = await GetIt.I.get<RestApi>().get(relativeUrl);
    if (response == null) {
      return [];
    }
    Map<String, dynamic> responseMap = jsonDecode(response);
    List<dynamic> results = responseMap['genres'];
    List<GenrerEntity> genres = results.map((genreJson) {
      return GenrerEntity.fromJson(genreJson);
    }).toList();
    return genres;
  } catch (e) {
    return [];
  }
}
