import 'package:flutter/material.dart';

import '../../../domain/entities/order_entity.dart';
import 'order_card.dart';

class OrdersListView extends StatelessWidget {
  final List<OrderEntity> orders;
  const OrdersListView({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemCount: orders.length,
      itemBuilder: (context, index) => OrderCard(order: orders[index]),
    );
  }
}
