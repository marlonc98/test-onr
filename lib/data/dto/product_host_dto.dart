import 'package:test_onr/domain/entities/product/product_entity.dart';

class ProductHostDto {
  static ProductEntity fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      id: json['id'],
      title: json['title'],
      price: double.parse((json['price'].toString())),
      description: json['description'],
      imageUrl: json['image'],
      rankingCount: json['rating']?['count'] ?? 0,
      rating: double.parse(json['rating']?['rate'].toString() ?? "0"),
      category: json['category'],
    );
  }
}
