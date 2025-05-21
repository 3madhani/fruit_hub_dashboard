import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';

import '../../errors/failure.dart';
import 'product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  @override
  Future<Either<Failure, void>> addProduct(ProductEntity product) async {
    // TODO: implement addProduct
    throw UnimplementedError();
  }
}