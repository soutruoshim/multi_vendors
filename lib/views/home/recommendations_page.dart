import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_venors/common/app_style.dart';
import 'package:multi_venors/common/reusable_text.dart';
import 'package:multi_venors/constants/constants.dart';
import 'package:multi_venors/views/home/widgets/food_tile.dart';

import '../../common/back_ground_container.dart';
import '../../common/shimmers/foodlist_shimmer.dart';
import '../../hooks/fetch_all_foods.dart';
import '../../models/foods_model.dart';

class RecommendationsPage extends HookWidget {
  const RecommendationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllFoods("41007428");
    List<FoodsModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: kOffWhite,
        title: ReusableText(text: "Recommendations",
            style: appStyle(13, kGray, FontWeight.w600)),
      ),
      body: BackGroundContainer(
      color: Colors.white,
      child: isLoading
          ? const FoodsListShimmer()
          : Padding(
        padding: EdgeInsets.all(12.h),
        child: ListView(
          children: List.generate(foods!.length, (i) {
            FoodsModel food = foods[i];
            return FoodTile(
              food: food,
            );
          }),
        ),
      ),
    ),
    );
  }
}