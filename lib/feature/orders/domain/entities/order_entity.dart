import 'package:fruit_hub_dashboard/core/enums/order_status.dart';

import 'order_product_entity.dart';
import 'shipping_address_entity.dart';

class OrderEntity {
  final double totalPrice;
  final ShippingAddressEntity shippingAddresseEtity;
  final String uid;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;
  final OrderStatus status;
  final DateTime date;

  OrderEntity({
    required this.totalPrice,
    required this.shippingAddresseEtity,
    required this.uid,
    required this.orderProducts,
    required this.paymentMethod,
    required this.status,
    required this.date,
  });

  String getFormattedDate() {
    return '${date.day}/${date.month}/${date.year} - ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}
