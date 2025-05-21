import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/repos/images_repo/images_repo.dart';
import '../../../../../core/repos/products_repo/product_repo.dart';
import '../../../domain/entities/product_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final ImagesRepo imagesRepo;
  final ProductRepo productRepo;
  AddProductCubit({required this.imagesRepo, required this.productRepo})
    : super(AddProductInitial());

  Future<void> addProduct(ProductEntity product) async {
    emit(AddProductLoading());
    final result = await imagesRepo.uploadImage(image: product.image);
    result.fold((failure) => emit(AddProductError(message: failure.message)), (
      success,
    ) async {
      product.imageUrl = success;
      var result = await productRepo.addProduct(product);
      result.fold(
        (failure) => emit(AddProductError(message: failure.message)),
        (success) =>
            emit(AddProductSuccess(message: "Product added successfully")),
      );
    });
  }
}
