import 'package:dartz/dartz.dart';

import '../../../feature/add_product/domain/entities/product_entity.dart';
import '../../errors/failure.dart';

abstract class ProductRepo {
  Future<Either<Failure, void>> addProduct(ProductEntity product);

}