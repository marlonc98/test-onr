import 'package:freezed_annotation/freezed_annotation.dart';
part 'genrer_entity.freezed.dart';
part 'genrer_entity.g.dart';

@freezed
class GenrerEntity with _$GenrerEntity {
  const factory GenrerEntity({
    required int id,
    required String name,
  }) = _GenrerEntity;

  factory GenrerEntity.fromJson(Map<String, dynamic> json) =>
      _$GenrerEntityFromJson(json);
}
