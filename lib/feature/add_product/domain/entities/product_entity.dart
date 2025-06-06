import 'dart:io';

import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/review_entity.dart';

class ProductEntity {
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
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.reviews,
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
}
