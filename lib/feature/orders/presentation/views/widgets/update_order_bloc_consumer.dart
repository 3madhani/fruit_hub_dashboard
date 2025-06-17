import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/common/custom_progress_hud.dart';

import '../../../../../core/common/show_snack_bar.dart';
import '../../manager/update_order_status_cubit/update_order_status_cubit.dart';

class UpdateOrderBlocConsumer extends StatelessWidget {
  final Widget child;

  const UpdateOrderBlocConsumer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateOrderStatusCubit, UpdateOrderStatusState>(
      listener: (context, state) {
        if (state is UpdateOrderStatusSuccess) {
          ShowCustomSnackBar.showSuccessSnackBar(
            context,
            "Order status updated successfully!",
          );
        }
        if (state is UpdateOrderStatusError) {
          ShowCustomSnackBar.showErrorSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
          isLoading: state is UpdateOrderStatusLoading,
          child: child,
        );
      },
    );
  }
}
