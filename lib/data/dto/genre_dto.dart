import 'package:test_rappi/domain/entities/genrer/genrer_entity.dart';

class GenreDto {
  static GenrerEntity fromJson(Map<String, dynamic> json) {
    return GenrerEntity(
      id: json['id'],
      name: json['name'],
    );
  }
}
