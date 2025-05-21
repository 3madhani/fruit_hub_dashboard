import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/common/custom_progress_hud.dart';

import '../../../../../core/common/build_snack_bar.dart';
import '../../cubit/add_product/add_product_cubit.dart';
import 'add_product_view_body.dart';

class AddProductViewbodyBloc extends StatelessWidget {
  const AddProductViewbodyBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          BuildSnackBar.buildSuccessSnackBar(context, state.message);
        }
        if (state is AddProductError) {
          BuildSnackBar.buildErrorSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
          isLoading: state is AddProductLoading,
          child: const AddProductViewBody(),
        );
      },
    );
  }
}
