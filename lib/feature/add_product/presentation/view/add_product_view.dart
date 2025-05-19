import 'package:flutter/material.dart';

import '../../../../core/common/custom_app_bar.dart';
import 'widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  static const routeName = 'add-product';

  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Add Product'),
      body: const AddProductViewBody(),
    );
  }
}
