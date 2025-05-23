import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_venors/common/custom_container.dart';
import 'package:multi_venors/constants/constants.dart';
import 'package:multi_venors/views/home/recommendations_page.dart';
import 'package:multi_venors/views/home/widgets/category_foods_list.dart';
import 'package:multi_venors/views/home/widgets/food_list.dart';
import 'package:multi_venors/views/home/widgets/nearby_restaurants_list.dart';
import 'package:multi_venors/controllers/category_controller.dart';
import '../../common/custom_appbar.dart';
import '../../common/heading.dart';
import 'all_fastest_foods_page.dart';
import 'all_nearby_restaurants.dart';
import 'widgets/category_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h),
          child: const CustomAppBar()),
      body: SafeArea(
        child: CustomContainer(containerContent: Column(
          children: [
            CategoryList(),
            Obx(
                  () => controller.categoryValue == ''
                  ?
                  Column(
              children: [
                Heading(
                  text: "Nearby Restaurants",
                  onTap: () {
                    Get.to(() =>const AllNearbyRestaurants(),
                        transition: Transition.cupertino,
                        duration: const Duration(milliseconds: 900));
                  },
                ),
                const NearbyRestaurants(),
                Heading(
                  text: "Try Something New",
                  onTap: () {
                    Get.to(() => const RecommendationsPage(),
                        transition: Transition.cupertino,
                        duration: const Duration(milliseconds: 900));
                  },
                ),
                const FoodsList(),
                Heading(
                  text: "Food closer to you",
                  onTap: () {
                    Get.to(() => const AllFastestFoods(),
                        transition: Transition.cupertino,
                        duration: const Duration(milliseconds: 900));
                  },
                ),
                const FoodsList(),
              ],
            ):CustomContainer(
                      containerContent: Column(
                        children: [
                          Heading(
                            more: true,
                            text: "Explore ${controller.titleValue} Category",
                            onTap: () {
                              Get.to(() => const RecommendationsPage(),
                                  transition: Transition.cupertino,
                                  duration: const Duration(milliseconds: 900));
                            },
                          ),

                          const CategoryFoodsList()
                        ],
                      )),
            )
          ],
        )),
      ),
    );
  }
}