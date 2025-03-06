import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/user/user_entity.dart';

Future<Either<ExceptionEntity, UserEntity>> getCurrentUserFake(
    String userSharedPrefKey) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(userSharedPrefKey);
    if (userJson != null) {
      final user = UserEntity.fromJson(jsonDecode(userJson));
      return Right(user);
    } else {
      return Left(ExceptionEntity());
    }
  } on Exception catch (e) {
    return Left(ExceptionEntity.fromException(e));
  }
}
