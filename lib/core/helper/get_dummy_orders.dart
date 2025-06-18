import '../../feature/orders/domain/entities/order_entity.dart';
import '../../feature/orders/domain/entities/order_product_entity.dart';
import '../../feature/orders/domain/entities/shipping_address_entity.dart';
import '../enums/order_status.dart';

List<OrderEntity> getDummyOrders() {
  return [
    OrderEntity(
      orderId: 'order_123',
      totalPrice: 450.0,
      shippingAddresseEtity: ShippingAddressEntity(
        name: 'John Doe',
        phone: '01001234567',
        email: 'john@example.com',
        floor: '2',
        address: '123 Main Street',
        city: 'Cairo',
      ),
      uid: 'user_123',
      orderProducts: [
        OrderProductEntity(
          name: 'Apple',
          code: 'A123',
          imageUrl:
              'https://imgs.search.brave.com/uwq-0ON1PxDsDaTfa2zLC3V61xRRUvKnIYkrZsKU8Ic/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTI1/ODg5NTg5Mi9waG90/by9mcnVpdC1ib3ds/LXZpZXctZnJvbS1h/Ym92ZS1iYW5hbmFz/LWFwcGxlcy1wZWFy/cy1ncmFwZXMtY3Vy/cmFudHMuanBnP3M9/NjEyeDYxMiZ3PTAm/az0yMCZjPXllU1Br/TzUzZXE4TWNOUGZL/UE1NeUh6b1E2ek16/cGQxMXMzUHQ0ODl4/cjA9',
          price: 50.0,
          quantity: 3,
        ),
        OrderProductEntity(
          name: 'Banana',
          code: 'B456',
          imageUrl:
              'https://imgs.search.brave.com/b7XgWVz-Sr2Yv4UB0pLQUs9NxtqVCmRVDz__m5eQfkA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTcx/NTc1ODExL3Bob3Rv/L2d1YXZhLmpwZz9z/PTYxMng2MTImdz0w/Jms9MjAmYz1jalZE/cGlzRnJUOEpscUZi/U0VJbWtmc1hnUWJ0/ck5DZFNUSUxHQXpJ/ajJRPQ',
          price: 25.0,
          quantity: 4,
        ),
      ],
      paymentMethod: 'Cash',
      status: OrderStatus.delivered,
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    OrderEntity(
      orderId: 'ord_789',
      totalPrice: 320.0,
      shippingAddresseEtity: ShippingAddressEntity(
        name: 'Sara Ahmed',
        phone: '01122334455',
        email: 'sara@example.com',
        floor: '5',
        address: '456 Nile Avenue',
        city: 'Alexandria',
      ),
      uid: 'user_456',
      orderProducts: [
        OrderProductEntity(
          name: 'Orange',
          code: 'O789',
          imageUrl:
              'https://imgs.search.brave.com/CpTa48sWalX5Km6JXzDGHq1y5lDMGm8-yPEJY22bszM/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvNTI5/NjY0NTcyL3Bob3Rv/L2ZydWl0LWJhY2tn/cm91bmQuanBnP3M9/NjEyeDYxMiZ3PTAm/az0yMCZjPUs3VjBy/VkNHajh0dmx1WERx/eEpndTBBZE1LRjhh/eFAwQTE1UC04S3No/M0k9',
          price: 40.0,
          quantity: 5,
        ),
      ],
      paymentMethod: 'PayPal',
      status: OrderStatus.canceled,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    OrderEntity(
      orderId: 'order_567',
      totalPrice: 200.0,
      shippingAddresseEtity: ShippingAddressEntity(
        name: 'Michael Nabil',
        phone: '01234567890',
        email: 'michael@example.com',
        floor: '1',
        address: '789 Garden Road',
        city: 'Tanta',
      ),
      uid: 'user_789',
      orderProducts: [
        OrderProductEntity(
          name: 'Mango',
          code: 'M321',
          imageUrl:
              'https://imgs.search.brave.com/UKvAGZHGzFP7inklArj2UCCH4krmvakUDj9e7UAWTPA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTM5/NzQzMDUyL3Bob3Rv/L2ZydWl0LmpwZz9z/PTYxMng2MTImdz0w/Jms9MjAmYz1IYWZj/WFZxUER1OTdHRDE3/cnZfYjBZUHJqcE0t/ZTA5Tk1uV2NGUUlV/aHVVPQ',
          price: 100.0,
          quantity: 2,
        ),
      ],
      paymentMethod: 'Cash',
      status: OrderStatus.pending,
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ];
}
