import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/services/database_services.dart';
import 'package:fruit_hub_dashboard/feature/add_product/data/models/product_model.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';

import '../../errors/failure.dart';
import '../../utils/backend_endpoints.dart';
import 'product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseServices databaseServices;
  // final FirebaseFirestore firestore;
  ProductRepoImpl({required this.databaseServices});

  // Future<bool> _productExistsByCode(String code) async {
  //   final result =
  //       await firestore
  //           .collection(BackendEndpoints.productsPath)
  //           .where('code', isEqualTo: code)
  //           .limit(1)
  //           .get();

  //   return result.docs.isNotEmpty;
  // }

  @override
  Future<Either<Failure, void>> addProduct(ProductEntity product) async {
    try {
      await databaseServices.setData(
        path: BackendEndpoints.productsPath,
        data: ProductModel.fromEntity(product).toJson(),
      );
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure("Failed to add product"));
    }
  }
}
