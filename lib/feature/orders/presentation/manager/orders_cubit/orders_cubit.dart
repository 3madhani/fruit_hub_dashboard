import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/feature/orders/domain/repos/orders_repo.dart';

import '../../../domain/entities/order_entity.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo ordersRepo;
  OrdersCubit(this.ordersRepo) : super(OrderInitial());

  Future<void> fetchOrders() async {
    emit(OrdersLoading());
    final result = await ordersRepo.fetchOrders();
    result.fold(
      (failure) => emit(OrdersError(message: failure.message)),
      (orders) => emit(OrdersLoaded(orders: orders)),
    );
  }
}
