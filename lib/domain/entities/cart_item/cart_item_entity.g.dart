// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemEntityImpl _$$CartItemEntityImplFromJson(Map<String, dynamic> json) =>
    _$CartItemEntityImpl(
      product: ProductEntity.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$CartItemEntityImplToJson(
        _$CartItemEntityImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
    };
