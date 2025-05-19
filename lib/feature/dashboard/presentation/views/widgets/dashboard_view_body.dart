import 'package:flutter/material.dart';

import '../../../../../core/common/custom_button.dart';
import '../../../../../core/constants/app_const.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConst.horizontalPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CustomPrimaryButton(title: 'Add Data', onPressed: () {})],
      ),
    );
  }
}
