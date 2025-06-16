import 'package:flutter/material.dart';

import '../../../../../core/constants/app_const.dart';
import '../../../domain/entities/order_entity.dart';
import 'filter_section.dart';
import 'orders_list_view.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key, required this.orders});
  final List<OrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConst.horizontalPadding,
            vertical: 10,
          ),
          sliver: SliverToBoxAdapter(child: FilterSection()),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConst.horizontalPadding,
          ),
          sliver: OrdersListView(orders: orders),
          ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ), // optional bottom spacing
      ],
    );
  }
}
