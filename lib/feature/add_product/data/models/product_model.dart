import 'dart:io';

import '../../domain/entities/product_entity.dart';

class ProductModel {
  final String title;
  final String description;
  final num price;
  final File image;
  final String code;
  final bool isFeatured;
  String? imageUrl;

  ProductModel({
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.code,
    required this.isFeatured,
    this.imageUrl,
  });

  factory ProductModel.fromEntity(ProductEntity product) => ProductModel(
    title: product.title,
    description: product.description,
    price: product.price,
    image: product.image,
    code: product.code,
    isFeatured: product.isFeatured,
    imageUrl: product.imageUrl,
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'price': price,
    'code': code,
    'isFeatured': isFeatured,
    'imageUrl': imageUrl,
  };
}
