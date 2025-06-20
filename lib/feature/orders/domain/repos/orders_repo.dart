import 'package:dartz/dartz.dart';

import '../../../../core/enums/order_status.dart';
import '../../../../core/errors/failure.dart';
import '../entities/order_entity.dart';

abstract class OrdersRepo {
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders();
  Future<Either<Failure, void>> updateOrderStatus({required OrderStatus status, required String orderId, required String date});
}
