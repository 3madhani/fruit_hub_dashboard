part of 'orders_cubit.dart';

final class OrderInitial extends OrdersState {}

final class OrdersError extends OrdersState {
  final String message;
  OrdersError({required this.message});
}

final class OrdersLoaded extends OrdersState {
  final List<OrderEntity> orders;
  OrdersLoaded({required this.orders});
}

final class OrdersLoading extends OrdersState {}

@immutable
sealed class OrdersState {}
