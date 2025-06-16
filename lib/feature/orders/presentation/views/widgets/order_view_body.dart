import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/constants/app_const.dart';
import 'package:fruit_hub_dashboard/core/helper/get_dummy_orders.dart';
import 'package:fruit_hub_dashboard/feature/orders/presentation/views/widgets/order_card.dart';

import 'filter_section.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = getDummyOrders();

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
          sliver: SliverList.separated(
            itemCount: orders.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return OrderCard(order: orders[index]);
            },
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ), // optional bottom spacing
      ],
    );
  }
}
