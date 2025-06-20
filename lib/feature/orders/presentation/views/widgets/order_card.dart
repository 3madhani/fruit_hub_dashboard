import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../domain/entities/order_entity.dart';
import 'info_row.dart';
import 'order_action_button.dart';
import 'product_title.dart';
import 'section_title.dart';

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
            const SectionTitle(title: 'Shipping Information'),
            InfoRow(
              label: 'Name',
              value: order.shippingAddresseEtity.name ?? '-',
            ),
            InfoRow(
              label: 'Phone',
              value: order.shippingAddresseEtity.phone ?? '-',
            ),
            InfoRow(
              label: 'Email',
              value: order.shippingAddresseEtity.email ?? '-',
            ),
            InfoRow(
              label: 'Address',
              value: order.shippingAddresseEtity.toString(),
            ),
            InfoRow(label: "Order ID", value: order.orderId),
            const SizedBox(height: 12),

            const SectionTitle(title: 'Products'),
            ...order.orderProducts.map(
              (item) => ProductTile(
                name: item.name,
                imageUrl: item.imageUrl,
                code: item.code,
                price: item.price,
                quantity: item.quantity,
              ),
            ),

            const Divider(height: 24),
            InfoRow(
              label: 'Total Price',
              value: '${order.totalPrice.toStringAsFixed(2)} EGP',
            ),
            InfoRow(label: 'Payment Method', value: order.paymentMethod),
            InfoRow(
              label: 'Status',
              value: order.status.name,
              color:
                  {
                    'pending': AppColors.warningLightColor,
                    'inProgress': AppColors.infoLightColor,
                    'delivered': AppColors.successLightColor,
                    'accepted': AppColors.primaryLightColor,
                    'canceled': AppColors.errorColor,
                    'outForDelivery': Colors.orange.shade300,
                  }[order.status.name] ??
                  Colors.black,
            ),
            InfoRow(label: 'Date', value: order.getFormattedDate()),
            const Divider(height: 24),
            OrderActionButton(orderEntity: order),
          ],
        ),
      ),
    );
  }
}
