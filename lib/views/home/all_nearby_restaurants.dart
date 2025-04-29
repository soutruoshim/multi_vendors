import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_venors/common/app_style.dart';
import 'package:multi_venors/common/reusable_text.dart';
import 'package:multi_venors/constants/constants.dart';
import 'package:multi_venors/views/home/widgets/restuarant_tile.dart';

import '../../common/back_ground_container.dart';
import '../../common/shimmers/foodlist_shimmer.dart';
import '../../hooks/fetch_all_restaurants.dart';
import '../../models/restaurants_model.dart';

class AllNearbyRestaurants extends HookWidget {
  const AllNearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllRestaurants("41007428");
    List<RestaurantsModel>? restaurants = hookResults.data;
    final isLoading = hookResults.isLoading;

    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: ReusableText(text: "Nearby Restaurants",
            style: appStyle(13, kLightWhite, FontWeight.w600)),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: isLoading
            ? const FoodsListShimmer()
            : Padding(
          padding: EdgeInsets.all(12.h),
          child: ListView(
            children: List.generate(restaurants!.length, (i) {
              RestaurantsModel restaurant = restaurants[i];
              return RestaurantTile(
                restaurant: restaurant,
              );
            }),
          ),
        ),
      ),
    );
  }
}