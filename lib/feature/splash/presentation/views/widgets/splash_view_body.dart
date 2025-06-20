import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub_dashboard/feature/dashboard/presentation/views/dashboard_view.dart';

import '../../../../../core/utils/app_assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SvgPicture.asset(Assets.svgPlant)],
        ),
        SvgPicture.asset(Assets.svgLogo),
        SvgPicture.asset(fit: BoxFit.fill, Assets.svgSplashBottom),
      ],
    );
  }

  void excuteNavigation() {
    // If the onboarding view has been seen, navigate to the login view
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, DashboardView.routeName);
      }
    });
  }

  @override
  void initState() {
    // Add any initialization logic here if needed
    excuteNavigation();

    super.initState();
  }
}
