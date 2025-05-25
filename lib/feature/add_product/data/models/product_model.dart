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
  final int expirationMonth;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num averageRating = 0.0;
  final num numberOfReviews = 0;

  ProductModel({
    this.isOrganic = false,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.code,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationMonth,
    required this.numberOfCalories,
    required this.unitAmount,
  });

  factory ProductModel.fromEntity(ProductEntity product) => ProductModel(
    title: product.title,
    description: product.description,
    price: product.price,
    image: product.image,
    code: product.code,
    isFeatured: product.isFeatured,
    imageUrl: product.imageUrl,
    expirationMonth: product.expirationMonth,
    numberOfCalories: product.numberOfCalories,
    unitAmount: product.unitAmount,
    isOrganic: product.isOrganic,
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'price': price,
    'code': code,
    'isFeatured': isFeatured,
    'imageUrl': imageUrl,
    'expirationMonth': expirationMonth,
    'numberOfCalories': numberOfCalories,
    'unitAmount': unitAmount,
    'isOrganic': isOrganic,
  };
}
