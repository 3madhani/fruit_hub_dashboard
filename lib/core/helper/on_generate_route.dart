import 'package:flutter/material.dart';

import '../../feature/add_product/presentation/view/add_product_view.dart';
import '../../feature/dashboard/presentation/views/dashboard_view.dart';
import '../../feature/error/presentation/views/error_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => const DashboardView());
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => const AddProductView());
    default:
      return MaterialPageRoute(
        builder: (BuildContext context) => const ErrorView(),
      );
  }
}
