import 'dart:io';

class ProductEntity {
  final String title;
  final String description;
  final num price;
  final File image;
  final String code;
  final bool isFeatured;
  final String? imageUrl;

  ProductEntity({
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.code,
    required this.isFeatured,
    this.imageUrl,
  });
}
