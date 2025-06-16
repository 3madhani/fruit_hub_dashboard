import 'package:flutter/material.dart';

import '../../../../core/common/custom_app_bar.dart';
import 'widgets/order_view_body.dart';

class OrderView extends StatelessWidget {
  static const routeName = 'order_view';
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Orders'),
      body: const OrderViewBody(),
    );
  }
}
