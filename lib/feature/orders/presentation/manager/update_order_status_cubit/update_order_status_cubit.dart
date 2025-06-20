import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/order_status.dart';
import '../../../domain/repos/orders_repo.dart';

part 'update_order_status_state.dart';

class UpdateOrderStatusCubit extends Cubit<UpdateOrderStatusState> {
  final OrdersRepo ordersRepo;

  UpdateOrderStatusCubit(this.ordersRepo) : super(UpdateOrderStatusInitial());

  Future<void> updateOrderStatus({
    required OrderStatus status,
    required String orderId,
    required String date,
  }) async {
    emit(UpdateOrderStatusLoading());
    final result = await ordersRepo.updateOrderStatus(
      status: status,
      orderId: orderId,
      date: date,
    );
    result.fold(
      (failure) => emit(UpdateOrderStatusError(failure.message)),
      (_) => emit(UpdateOrderStatusSuccess()),
    );
  }
}
