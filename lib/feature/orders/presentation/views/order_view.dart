import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/custom_app_bar.dart';
import '../../../../core/services/get_it_service.dart';
import '../../domain/repos/orders_repo.dart';
import '../manager/fetch_orders_cubit/fetch_orders_cubit.dart';
import '../manager/update_order_status_cubit/update_order_status_cubit.dart';
import 'widgets/orders_view_body_builder.dart';
import 'widgets/update_order_bloc_consumer.dart';

class OrderView extends StatelessWidget {
  static const routeName = 'order_view';
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchOrdersCubit(getIt.get<OrdersRepo>()),
        ),
        BlocProvider(
          create: (context) => UpdateOrderStatusCubit(getIt.get<OrdersRepo>()),
        ),
      ],
      child: Scaffold(
        appBar: customAppBar(title: 'Orders'),
        body: const UpdateOrderBlocConsumer(child: OrdersViewBodyBuilder()),
      ),
    );
  }
}
