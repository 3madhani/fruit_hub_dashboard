import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../domain/entities/order_entity.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionTitle(title: 'Shipping Information'),
            _InfoRow(
              label: 'Name',
              value: order.shippingAddressModel.name ?? '-',
            ),
            _InfoRow(
              label: 'Phone',
              value: order.shippingAddressModel.phone ?? '-',
            ),
            _InfoRow(
              label: 'Email',
              value: order.shippingAddressModel.email ?? '-',
            ),
            _InfoRow(
              label: 'Address',
              value:
                  '${order.shippingAddressModel.address}, ${order.shippingAddressModel.floor}, ${order.shippingAddressModel.city}',
            ),
            const SizedBox(height: 12),

            const _SectionTitle(title: 'Products'),
            ...order.orderProducts.map(
              (item) => _ProductTile(
                name: item.name,
                imageUrl: item.imageUrl,
                code: item.code,
                price: item.price,
                quantity: item.quantity,
              ),
            ),

            const Divider(height: 24),
            _InfoRow(
              label: 'Total Price',
              value: '${order.totalPrice.toStringAsFixed(2)} EGP',
            ),
            _InfoRow(label: 'Payment Method', value: order.paymentMethod),
            _InfoRow(label: 'Status', value: order.status),
            _InfoRow(
              label: 'Date',
              value:
                  '${order.date.day}/${order.date.month}/${order.date.year} - ${order.date.hour}:${order.date.minute.toString().padLeft(2, '0')}',
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(label, style: AppTextStyles.medium14)),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.bold14,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductTile extends StatelessWidget {
  final String name;
  final String code;
  final int quantity;
  final String imageUrl;
  final double price;

  const _ProductTile({
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
            child:
                imageUrl.isEmpty
                    ? Image.network(
                      'https://placehold.co/600x400',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )
                    : Image.network(
                      imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
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
                Text('Qty: $quantity', style: AppTextStyles.medium12),
              ],
            ),
          ),
          Text(
            '${price.toStringAsFixed(2)} EGP',
            style: AppTextStyles.bold14.copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        title,
        style: AppTextStyles.bold16.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
