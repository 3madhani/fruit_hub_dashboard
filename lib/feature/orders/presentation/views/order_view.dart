import 'package:flutter/material.dart';

import 'widgets/order_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});
  static const routeName = 'order_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrderViewBody(),
    );
  }
}

