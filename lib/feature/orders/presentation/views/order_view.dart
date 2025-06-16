import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/feature/orders/presentation/manager/orders_cubit/orders_cubit.dart';

import '../../../../core/common/custom_app_bar.dart';
import '../../../../core/services/get_it_service.dart';
import '../../domain/repos/orders_repo.dart';
import 'widgets/orders_view_body_builder.dart';

class OrderView extends StatelessWidget {
  static const routeName = 'order_view';
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit(getIt.get<OrdersRepo>()),
      child: Scaffold(
        appBar: customAppBar(title: 'Orders'),
        body: const OrdersViewBodyBuilder(),
      ),
    );
  }
}
