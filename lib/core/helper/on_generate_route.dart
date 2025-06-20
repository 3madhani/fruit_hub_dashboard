import 'package:flutter/material.dart';

import '../../feature/add_product/presentation/view/add_product_view.dart';
import '../../feature/dashboard/presentation/views/dashboard_view.dart';
import '../../feature/error/presentation/views/error_view.dart';
import '../../feature/orders/presentation/views/order_view.dart';
import '../../feature/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => const DashboardView());
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => const AddProductView());
    case OrderView.routeName:
      return MaterialPageRoute(builder: (context) => const OrderView());
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    default:
      return MaterialPageRoute(
        builder: (BuildContext context) => const ErrorView(),
      );
  }
}
