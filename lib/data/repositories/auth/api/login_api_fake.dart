import 'dart:async';
import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_onr/domain/entities/exception_entity.dart';
import 'package:test_onr/domain/entities/user/user_entity.dart';

const fakeUser = UserEntity(
  id: 1,
  fullname: 'John Doe',
  username: 'johndoe',
  email: 'jhon.doe@mail.com',
  address: '123 Main St',
  phone: '123-456-7890',
);

Future<Either<ExceptionEntity, UserEntity>> loginApiFake({
  required String email,
  required String password,
  required String userSharedPrefKey,
}) async {
  try {
    await Future.delayed(const Duration(milliseconds: 500));
    final prefs = await SharedPreferences.getInstance();
    final userJson = jsonEncode(fakeUser.toJson());
    await prefs.setString(userSharedPrefKey, userJson);
    return const Right(fakeUser);
  } catch (e) {
    return Left(ExceptionEntity(message: e.toString()));
  }
}
