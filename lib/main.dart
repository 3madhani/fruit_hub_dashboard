import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruit_hub_dashboard/feature/dashboard/presentation/views/dashboard_view.dart';
import 'package:fruit_hub_dashboard/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/helper/on_generate_route.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/utils/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://bijbtnxvwmecvfkkxagp.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpamJ0bnh2d21lY3Zma2t4YWdwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDg3MzAzMTEsImV4cCI6MjA2NDMwNjMxMX0.4wEAEYz4R5v3NJnX5SHjtCaz32J6IxL6Hgb0-FcenNo',
  );

  // Bloc Observer
  Bloc.observer = CustomBlocObserver();
  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Initialize GetIt
  setupGetIt();
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
