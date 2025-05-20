import '../../../feature/add_product/domain/entities/product_entity.dart';

abstract class ProductRepo {
  Future<void> addProduct(ProductEntity product);

}