
import '../../domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? phone;
  String? email;
  String? floor;
  String? address;
  String? city;

  ShippingAddressModel({
    this.floor,
    this.name,
    this.phone,
    this.email,
    this.address,
    this.city,
  });

  ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    floor = json['floor'];
    address = json['address'];
    city = json['city'];
  }

  ShippingAddressEntity toEntity() => ShippingAddressEntity(
        name: name,
        phone: phone,
        email: email,
        floor: floor,
        address: address,
        city: city,
      );
}
