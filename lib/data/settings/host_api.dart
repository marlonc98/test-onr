import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_rappi/data/repositories/localization/localization_repository_impl.dart';

import 'package:test_rappi/data/settings/rest_api.dart';

class HostApi extends RestApi {
  //load depending flavors
  HostApi({
    super.hostUrl = "https://api.themoviedb.org/3/",
  });

  @override
  Future<Map<String, String>> headers() async {
    return {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYmQzY2IwYmFlNjY4MzIxYTU5MzMyMjlkNDllNWRjNyIsIm5iZiI6MTczODcyMDQ0Ny41NDgsInN1YiI6IjY3YTJjNGJmZGMyNGVlOTNkMTgxMDc3NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GAvN1fTcx9OrdzPuqAfy8t1ruXt4wZPQx7a4MgZDU9Q',
      "Content-Type": "application/json; charset=utf-8"
    };
  }

  Future<String> _addLanguage(String urlToFix) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode =
        prefs.getString(LocalizationRepositoryImpl.localizationRepositoryKey);
    if (languageCode != null) {
      //if relative Url not include language code
      if (!urlToFix.contains('?')) {
        return '$urlToFix?$languageCode';
      } else {
        return '$urlToFix&$languageCode';
      }
    }
    return urlToFix;
  }

  @override
  Future<String?> post(relativeUrl, values) async {
    String relativeUrlWithLanguage = await _addLanguage(relativeUrl);
    return super.post(relativeUrlWithLanguage, values);
  }

  @override
  Future<String?> get(relativeUrl) async {
    String relativeUrlWithLanguage = await _addLanguage(relativeUrl);
    return super.get(relativeUrlWithLanguage);
  }
}
