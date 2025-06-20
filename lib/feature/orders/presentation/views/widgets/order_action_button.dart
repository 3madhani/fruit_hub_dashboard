import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/feature/orders/presentation/manager/update_order_status_cubit/update_order_status_cubit.dart';

import '../../../../../core/enums/order_status.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../domain/entities/order_entity.dart';

class OrderActionButton extends StatelessWidget {
  final OrderEntity orderEntity;
  const OrderActionButton({super.key, required this.orderEntity});

  @override
  Widget build(BuildContext context) {
    final status = orderEntity.status;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildActionButton(
            context: context,
            label: 'Accept',
            icon: Icons.done,
            isEnabled: status == OrderStatus.pending,
            activeColor: AppColors.primaryLightColor,
            onPressed: () {
              context.read<UpdateOrderStatusCubit>().updateOrderStatus(
                status: OrderStatus.accepted,
                orderId: orderEntity.orderId,
                date: DateTime.now().toString(),
              );
            },
          ),
          _buildActionButton(
            context: context,
            label: 'Cancel',
            icon: Icons.cancel,
            isEnabled: status == OrderStatus.pending,
            activeColor: AppColors.errorColor,
            onPressed: () {
              context.read<UpdateOrderStatusCubit>().updateOrderStatus(
                status: OrderStatus.canceled,
                orderId: orderEntity.orderId,
                date: DateTime.now().toString(),
              );
            },
          ),
          _buildActionButton(
            context: context,
            label: 'In Progress',
            icon: Icons.settings,
            isEnabled: status == OrderStatus.accepted,
            activeColor: AppColors.infoLightColor,
            onPressed: () {
              context.read<UpdateOrderStatusCubit>().updateOrderStatus(
                status: OrderStatus.inProgress,
                orderId: orderEntity.orderId,
                date: DateTime.now().toString(),
              );
            },
          ),
          _buildActionButton(
            context: context,
            label: 'Out For Delivery',
            icon: Icons.settings,
            isEnabled: status == OrderStatus.inProgress,
            activeColor: Colors.orange.shade300,
            onPressed: () {
              context.read<UpdateOrderStatusCubit>().updateOrderStatus(
                status: OrderStatus.outForDelivery,
                orderId: orderEntity.orderId,
                date: DateTime.now().toString(),
              );
            },
          ),

          _buildActionButton(
            context: context,
            label: 'Delivered',
            icon: Icons.local_shipping,
            isEnabled: status == OrderStatus.outForDelivery,
            activeColor: AppColors.successLightColor,
            onPressed: () {
              context.read<UpdateOrderStatusCubit>().updateOrderStatus(
                status: OrderStatus.delivered,
                orderId: orderEntity.orderId,
                date: DateTime.now().toString(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required bool isEnabled,
    required Color activeColor,
    required VoidCallback onPressed,
  }) {
    final backgroundColor = isEnabled ? activeColor : Colors.grey.shade300;
    final foregroundColor = isEnabled ? Colors.white : Colors.grey.shade600;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: TextButton.icon(
        onPressed: isEnabled ? onPressed : null,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        icon: Icon(icon, color: foregroundColor),
        label: Text(label, style: TextStyle(color: foregroundColor)),
      ),
    );
  }
}
