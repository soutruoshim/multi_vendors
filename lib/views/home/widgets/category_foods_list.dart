import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_venors/common/shimmers/foodlist_shimmer.dart';
import 'package:multi_venors/constants/constants.dart';
import 'package:multi_venors/hooks/fetch_category_foods.dart';
import 'package:multi_venors/models/foods_model.dart';
import 'package:multi_venors/views/home/widgets/food_tile.dart';

class CategoryFoodsList extends HookWidget {
  const CategoryFoodsList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchFoodsByCategory("41007428");
    List<FoodsModel>? foods = hookResult.data;
    final isLoading = hookResult.isLoading;
    return SizedBox(
      width: width,
      height: height,
      child: isLoading
          ? const FoodsListShimmer()
          : Padding(
        padding: EdgeInsets.all(12.h),
        child: ListView(
          children: List.generate(foods.length, (i) {
            FoodsModel food = foods[i];
            return FoodTile(
              color: Colors.white,
              food: food,
            );
          }),
        ),
      ),
    );
  }
}
