import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/order_entity.dart';
import '../../../domain/repos/orders_repo.dart';

part 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  final OrdersRepo ordersRepo;
  StreamSubscription? subscription;

  FetchOrdersCubit(this.ordersRepo) : super(FetchOrderInitial());

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }

  void fetchOrders() {
    emit(FetchOrdersLoading());
    subscription = ordersRepo.fetchOrders().listen(
      (result) => result.fold(
        (failure) => emit(FetchOrdersError(message: failure.message)),
        (orders) => emit(FetchOrdersLoaded(orders: orders)),
      ),
    );
  }
}
