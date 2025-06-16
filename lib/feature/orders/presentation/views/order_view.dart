import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/feature/orders/presentation/manager/order_cubit/order_cubit.dart';

import '../../../../core/common/custom_app_bar.dart';
import '../../../../core/services/get_it_service.dart';
import '../../domain/repos/orders_repo.dart';
import 'widgets/order_view_body.dart';

class OrderView extends StatelessWidget {
  static const routeName = 'order_view';
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(getIt.get<OrdersRepo>()),
      child: Scaffold(
        appBar: customAppBar(title: 'Orders'),
        body: const OrderViewBody(),
      ),
    );
  }
}
