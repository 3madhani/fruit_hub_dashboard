part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrdersLoading extends OrderState {}

final class OrdersLoaded extends OrderState {
  final List<OrderEntity> orders;
  OrdersLoaded({required this.orders});
}

final class OrdersError extends OrderState {
  final String message;
  OrdersError({required this.message});
}
