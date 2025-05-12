import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:multi_venors/common/shimmers/foodlist_shimmer.dart';
import 'package:multi_venors/constants/constants.dart';
import 'package:multi_venors/hooks/fetch_orders.dart';
import 'package:multi_venors/models/client_orders.dart';
import 'package:multi_venors/views/orders/widgets/client_order_tile.dart';

class Delivering extends HookWidget {
  const Delivering({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchOrders('Out_for_Delivery', 'Completed');

    List<ClientOrders> orders = hookResults.data;
    final isLoading = hookResults.isLoading;

    if (isLoading) {
      return const FoodsListShimmer();
    }

    return SizedBox(
      height: height * 0.8,
      child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, i) {
            return ClientOrderTile(food: orders[i].orderItems[0]);
          }),
    );
  }
}
