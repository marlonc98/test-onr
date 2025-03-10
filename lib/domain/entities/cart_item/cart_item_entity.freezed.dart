// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartItemEntity _$CartItemEntityFromJson(Map<String, dynamic> json) {
  return _CartItemEntity.fromJson(json);
}

/// @nodoc
mixin _$CartItemEntity {
  ProductEntity get product => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Serializes this CartItemEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemEntityCopyWith<CartItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemEntityCopyWith<$Res> {
  factory $CartItemEntityCopyWith(
          CartItemEntity value, $Res Function(CartItemEntity) then) =
      _$CartItemEntityCopyWithImpl<$Res, CartItemEntity>;
  @useResult
  $Res call({ProductEntity product, int quantity});

  $ProductEntityCopyWith<$Res> get product;
}

/// @nodoc
class _$CartItemEntityCopyWithImpl<$Res, $Val extends CartItemEntity>
    implements $CartItemEntityCopyWith<$Res> {
  _$CartItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductEntity,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of CartItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductEntityCopyWith<$Res> get product {
    return $ProductEntityCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartItemEntityImplCopyWith<$Res>
    implements $CartItemEntityCopyWith<$Res> {
  factory _$$CartItemEntityImplCopyWith(_$CartItemEntityImpl value,
          $Res Function(_$CartItemEntityImpl) then) =
      __$$CartItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductEntity product, int quantity});

  @override
  $ProductEntityCopyWith<$Res> get product;
}

/// @nodoc
class __$$CartItemEntityImplCopyWithImpl<$Res>
    extends _$CartItemEntityCopyWithImpl<$Res, _$CartItemEntityImpl>
    implements _$$CartItemEntityImplCopyWith<$Res> {
  __$$CartItemEntityImplCopyWithImpl(
      _$CartItemEntityImpl _value, $Res Function(_$CartItemEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
  }) {
    return _then(_$CartItemEntityImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductEntity,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemEntityImpl implements _CartItemEntity {
  const _$CartItemEntityImpl({required this.product, required this.quantity});

  factory _$CartItemEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemEntityImplFromJson(json);

  @override
  final ProductEntity product;
  @override
  final int quantity;

  @override
  String toString() {
    return 'CartItemEntity(product: $product, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemEntityImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, product, quantity);

  /// Create a copy of CartItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemEntityImplCopyWith<_$CartItemEntityImpl> get copyWith =>
      __$$CartItemEntityImplCopyWithImpl<_$CartItemEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemEntityImplToJson(
      this,
    );
  }
}

abstract class _CartItemEntity implements CartItemEntity {
  const factory _CartItemEntity(
      {required final ProductEntity product,
      required final int quantity}) = _$CartItemEntityImpl;

  factory _CartItemEntity.fromJson(Map<String, dynamic> json) =
      _$CartItemEntityImpl.fromJson;

  @override
  ProductEntity get product;
  @override
  int get quantity;

  /// Create a copy of CartItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemEntityImplCopyWith<_$CartItemEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
