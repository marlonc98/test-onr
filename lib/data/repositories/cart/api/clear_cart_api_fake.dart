import 'package:either_dart/either.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';

Future<Either<ExceptionEntity, void>> clearCartApiFake({
  required String cartSharedPrefKey,
}) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(cartSharedPrefKey);
    return const Right(null);
  } catch (e) {
    return Left(ExceptionEntity.fromException(e));
  }
}
