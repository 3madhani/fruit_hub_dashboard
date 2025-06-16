import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure, List<OrderEntity>>> fetchOrders();
}
