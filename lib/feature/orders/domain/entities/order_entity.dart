import 'order_product_entity.dart';
import 'shipping_address_entity.dart';

class OrderEntity {
  final double totalPrice;
  final ShippingAddressEntity shippingAddressModel;
  final String uid;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;
  final String status;
  final DateTime date;

  OrderEntity({
    required this.totalPrice,
    required this.shippingAddressModel,
    required this.uid,
    required this.orderProducts,
    required this.paymentMethod,
    required this.status,
    required this.date,
  });

}
