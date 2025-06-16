import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/database_services.dart';
import '../../../../core/utils/backend_endpoints.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repos/orders_repo.dart';
import '../model/order_model.dart';

class OrdersRepoImpl implements OrdersRepo {
  DatabaseServices databaseServices;
  OrdersRepoImpl({required this.databaseServices});
  @override
  Future<Either<Failure, List<OrderEntity>>> fetchOrders() async {
    try {
      var data = await databaseServices.getData(
        path: BackendEndpoints.getOrders,
      );

      List<OrderEntity> orders =
          (data as List<dynamic>)
              .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
              .toList();

      return Right(orders);
    } catch (e) {
      return const Left(ServerFailure("Failed to fetch orders"));
    }
  }
}
