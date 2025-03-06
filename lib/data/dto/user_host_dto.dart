import 'package:test_onr/domain/entities/user/user_entity.dart';

class UserHostDto {
  static UserEntity fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      fullname: "${json['name']['firstname']} ${json['name']['lastname']}",
      username: json['username'],
      email: json['email'],
      address: json['address']['street'],
      phone: json['phone'],
    );
  }
}
