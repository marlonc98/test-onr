import 'package:either_dart/either.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';

Future<Either<ExceptionEntity, void>> logoutApiFake(
  String userSharedPrefKey,
) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(userSharedPrefKey);
    return const Right(null);
  } catch (e) {
    return Left(ExceptionEntity(message: e.toString()));
  }
}
