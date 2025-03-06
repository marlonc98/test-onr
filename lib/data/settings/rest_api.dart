import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:test_rappi/domain/entities/exception_entity.dart';

class RestApi {
  String hostUrl;

  RestApi({this.hostUrl = ''});

  Future<Map<String, String>> headers() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return {
      'Authorization': 'Bearer ${sharedPreferences.getString('token')}',
      "Content-Type": "application/json; charset=utf-8",
    };
  }

  Future<String?> post(relativeUrl, values) async {
    Map<String, String> headers = await this.headers();

    Uri url = Uri.parse(hostUrl + relativeUrl);
    Future<http.Response> response =
        http.post(url, headers: headers, body: json.encode(values));
    return await parseResponse(
        response, relativeUrl, 'POST', json.encode(values));
  }

  Future<String?> get(relativeUrl) async {
    Map<String, String> headers = await this.headers();
    Uri url = Uri.parse(hostUrl + relativeUrl);
    Future<http.Response> response = http.get(url, headers: headers);
    return await parseResponse(response, relativeUrl, 'GET', '');
  }

  Future<String?> parseResponse(Future<http.Response> petition,
      String relativeUrl, String method, String body) async {
    try {
      http.Response response = await petition;
      log('Response: ${response.body}');
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return response.body;
      } else {
        try {
          Map<String, dynamic> responseJson = jsonDecode(response.body);
          Map<String, Object> resume = {
            "relativeUrl": relativeUrl,
            "payload": body,
            "method": method,
            "statusCode": response.statusCode,
            "response": responseJson.toString()
          };

          throw ExceptionEntity(
            message: resume.toString(),
            code: responseJson['code'] != null
                ? ("server_error_${responseJson['code']}")
                : "Error desconocido",
          );
        } catch (e) {
          if (e is Exception) {
            throw ExceptionEntity.fromException(e);
          } else {
            throw ExceptionEntity();
          }
        }
      }
    } catch (e) {
      if (e is http.ClientException) {
        throw ExceptionEntity(
          code: "Sin conexión a internet",
        );
      }
      rethrow;
    }
  }
}
