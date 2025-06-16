import '../../domain/entities/order_entity.dart';
import 'order_product_model.dart';
import 'shipping_address_model.dart';

class OrderModel {
  final double totalPrice;
  final ShippingAddressModel shippingAddressModel;
  final String uid;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String status;
  final DateTime date;

  OrderModel({
    required this.totalPrice,
    required this.shippingAddressModel,
    required this.uid,
    required this.orderProducts,
    required this.paymentMethod,
    required this.status,
    required this.date,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    totalPrice: json['totalPrice'] as double,
    shippingAddressModel: ShippingAddressModel.fromJson(
      json['shippingAddressModel'] as Map<String, dynamic>,
    ),
    uid: json['uid'] as String,
    orderProducts:
        (json['orderProducts'] as List)
            .map((e) => OrderProductModel.fromJson(e as Map<String, dynamic>))
            .toList(),
    paymentMethod: json['paymentMethod'] as String,
    status: json['status'] as String,
    date: DateTime.parse(json['date'] as String),
  );

  OrderEntity toEntity() => OrderEntity(
    totalPrice: totalPrice,
    shippingAddressModel: shippingAddressModel.toEntity(),
    uid: uid,
    orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
    paymentMethod: paymentMethod,
    status: status,
    date: date,
  );
}
