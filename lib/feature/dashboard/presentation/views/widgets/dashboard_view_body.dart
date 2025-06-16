import 'package:flutter/material.dart';

import '../../../../../core/common/custom_button.dart';
import '../../../../../core/constants/app_const.dart';
import '../../../../add_product/presentation/view/add_product_view.dart';
import '../../../../orders/presentation/views/order_view.dart';

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
        children: [
          CustomPrimaryButton(
            title: 'Add Product',
            onPressed: () {
              Navigator.pushNamed(context, AddProductView.routeName);
            },
          ),
          const SizedBox(height: 20),
          CustomPrimaryButton(
            title: 'View Orders',
            onPressed: () {
              Navigator.pushNamed(context, OrderView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
