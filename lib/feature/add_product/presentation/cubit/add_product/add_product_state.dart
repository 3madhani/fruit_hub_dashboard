part of 'add_product_cubit.dart';

final class AddProductError extends AddProductState {
  final String message;
  AddProductError({required this.message});
}

final class AddProductInitial extends AddProductState {}

final class AddProductLoading extends AddProductState {}

@immutable
sealed class AddProductState {}

final class AddProductSuccess extends AddProductState {
  final String message;
  AddProductSuccess({required this.message});
}
