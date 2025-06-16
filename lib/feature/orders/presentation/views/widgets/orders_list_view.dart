// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'order_card.dart';

// class OrdersListView extends StatelessWidget {
//   const OrdersListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<OrdersCubit, OrdersState>(
//       builder: (context, state) {
//         if (state is OrdersLoading) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is OrdersLoaded) {
//           final orders = state.orders;
//           return ListView.separated(
//             padding: const EdgeInsets.all(16),
//             itemCount: orders.length,
//             separatorBuilder: (_, __) => const SizedBox(height: 16),
//             itemBuilder: (context, index) => OrderCard(order: orders[index]),
//           );
//         } else if (state is OrdersError) {
//           return Center(child: Text(state.message));
//         } else {
//           return const SizedBox();
//         }
//       },
//     );
//   }
// }
