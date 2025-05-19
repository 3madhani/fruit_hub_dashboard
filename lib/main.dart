import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/feature/dashboard/presentation/views/dashboard_view.dart';

import 'core/helper/on_generate_route.dart';
import 'core/utils/app_colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
      initialRoute: DashboardView.routeName,
    );
  }
}
