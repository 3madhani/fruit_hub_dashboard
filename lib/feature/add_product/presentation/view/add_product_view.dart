import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/cubit/add_product/add_product_cubit.dart';

import '../../../../core/common/custom_app_bar.dart';
import '../../../../core/repos/images_repo/images_repo.dart';
import '../../../../core/repos/products_repo/product_repo.dart';
import 'widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  static const routeName = 'add-product';

  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Add Product'),
      body: BlocProvider(
        create: (context) => AddProductCubit(
          productRepo: getIt.get<ProductRepo>(),
          imagesRepo: getIt.get<ImagesRepo>(),
        ),
        child: const AddProductViewBody(),
      ),
    );
  }
}
