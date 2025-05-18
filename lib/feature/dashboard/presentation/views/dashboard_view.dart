import 'package:flutter/material.dart';

import 'widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  static const String routeName = 'dashboard';

  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: DashboardViewBody());
  }
}
