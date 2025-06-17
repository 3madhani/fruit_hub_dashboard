import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ProductTile extends StatelessWidget {
  final String name;
  final String code;
  final int quantity;
  final String imageUrl;
  final double price;

  const ProductTile({
    super.key,
    required this.name,
    required this.code,
    required this.quantity,
    required this.imageUrl,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              fit: BoxFit.contain,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder:
                  (context, url) => const SizedBox(
                    height: 10,
                    width: 10,
                    child: CircularProgressIndicator(),
                  ),
              imageUrl: imageUrl,
              height: 50,
              width: 50,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTextStyles.bold14),
                const SizedBox(height: 2),
                Text('Code: $code', style: AppTextStyles.medium12),
                Text('Qty: $quantity kg', style: AppTextStyles.medium12),
              ],
            ),
          ),
          Text(
            '${price.toStringAsFixed(2)} EGP',
            style: AppTextStyles.bold14.copyWith(
              color: AppColors.primaryLightColor,
            ),
          ),
        ],
      ),
    );
  }
}
