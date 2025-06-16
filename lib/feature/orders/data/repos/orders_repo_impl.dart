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
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders() async* {
    try {
      await for (var (data as List<Map<String, dynamic>>) in databaseServices
          .streamData(path: BackendEndpoints.getOrders)) {
        List<OrderEntity> orders =
            (data as List<dynamic>)
                .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
                .toList();
        yield Right(orders);
      }
    } catch (e) {
      yield const Left(ServerFailure("Failed to fetch orders"));
    }
  }
}
