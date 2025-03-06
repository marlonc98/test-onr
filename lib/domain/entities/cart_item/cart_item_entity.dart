import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_onr/domain/entities/product/product_entity.dart';
part 'cart_item_entity.freezed.dart';
part 'cart_item_entity.g.dart';

@freezed
class CartItemEntity with _$CartItemEntity {
  const factory CartItemEntity({
    required ProductEntity product,
    required int quantity,
  }) = _CartItemEntity;

  factory CartItemEntity.fromJson(Map<String, dynamic> json) =>
      _$CartItemEntityFromJson(json);
}
