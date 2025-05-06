import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_venors/constants/uidata.dart';
import 'package:multi_venors/views/home/widgets/food_widget.dart';

import '../../../common/shimmers/nearby_shimmer.dart';
import '../../../hooks/fetch_foods.dart';
import '../../../models/foods_model.dart';
import 'package:get/get.dart';

import '../../food/food_page.dart';

class FoodsList extends HookWidget {
  const FoodsList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchFoods("41007428");
    List<FoodsModel> foods = hookResults.data;
    final isLoading = hookResults.isLoading;

    return isLoading
        ? const NearbyShimmer()
        : Container(
      height: 180.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(foods.length, (i) {
          FoodsModel food = foods[i];
          return FoodWidget(
              onTap: () {
                Get.to(() => FoodPage(food: food));
              },
              image: food.imageUrl[0],
              title: food.title,
              time: food.time,
              price: food.price.toStringAsFixed(2));
        }),
      ),
    );
  }
}
