part of 'fetch_orders_cubit.dart';

final class FetchOrderInitial extends FetchOrdersState {}

final class FetchOrdersError extends FetchOrdersState {
  final String message;
  FetchOrdersError({required this.message});
}

final class FetchOrdersLoaded extends FetchOrdersState {
  final List<OrderEntity> orders;
  FetchOrdersLoaded({required this.orders});
}

final class FetchOrdersLoading extends FetchOrdersState {}

@immutable
sealed class FetchOrdersState {}
