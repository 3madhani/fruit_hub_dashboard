import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helper/get_dummy_orders.dart';
import '../../manager/fetch_orders_cubit/fetch_orders_cubit.dart';
import 'order_view_body.dart';

class OrdersViewBodyBuilder extends StatefulWidget {
  const OrdersViewBodyBuilder({super.key});

  @override
  State<OrdersViewBodyBuilder> createState() => _OrdersViewBodyBuilderState();
}

class _OrdersViewBodyBuilderState extends State<OrdersViewBodyBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrdersCubit, FetchOrdersState>(
      builder: (context, state) {
        if (state is FetchOrdersLoading) {
          return Skeletonizer(child: OrderViewBody(orders: getDummyOrders()));
        } else if (state is FetchOrdersLoaded) {
          if (state.orders.isEmpty) {
            return const Center(
              child: Text(
                'No orders found!',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          }
          return OrderViewBody(orders: state.orders);
        } else if (state is FetchOrdersError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Something went wrong!'));
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<FetchOrdersCubit>().fetchOrders();
  }
}
