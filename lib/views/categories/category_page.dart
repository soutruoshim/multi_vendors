import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_venors/constants/constants.dart';

import '../../common/app_style.dart';
import '../../common/back_ground_container.dart';
import '../../common/reusable_text.dart';
import '../../common/shimmers/foodlist_shimmer.dart';
import '../../controllers/category_controller.dart';
import '../../hooks/fetch_category_foods.dart';
import '../../models/foods_model.dart';
import 'package:get/get.dart';

import '../home/widgets/food_tile.dart';

class CategoryPage extends HookWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final hookResult = useFetchFoodsByCategory("41007428");
    List<FoodsModel>? foods = hookResult.data;
    final isLoading = hookResult.isLoading;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        leading: IconButton(
          onPressed: () {
            controller.updateCategory = '';
            controller.updateTitle = '';
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kDark,
          ),
          color: kGray,
        ),
        title: ReusableText(
            text: "${controller.titleValue} Category",
            style: appStyle(13, kGray, FontWeight.w600)),
      ),
      body: BackGroundContainer(
          color: Colors.white,
          child: SizedBox(
            height: height,
            child: isLoading
                ? const FoodsListShimmer()
                : Padding(
              padding: EdgeInsets.all(12.h),
              child: ListView(
                children: List.generate(foods.length, (i) {
                  FoodsModel food = foods[i];
                  return FoodTile(
                    food: food,
                  );
                }),
              ),
            ),
          ),
      ),
    );
  }
}