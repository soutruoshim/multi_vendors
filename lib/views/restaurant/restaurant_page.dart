import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:multi_venors/common/app_style.dart';
import 'package:multi_venors/common/reusable_text.dart';
import 'package:multi_venors/constants/constants.dart';
import 'package:multi_venors/models/restaurants_model.dart';
import 'package:multi_venors/views/restaurant/directions_page.dart';
import 'package:multi_venors/views/restaurant/widget/restaurant_bottom_bar.dart';
import 'package:multi_venors/views/restaurant/widget/restaurant_top_bar.dart';
import 'package:multi_venors/views/restaurant/widget/row_text.dart';
import 'package:get/get.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key, required this.restaurant});

  final RestaurantsModel? restaurant;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kLightWhite,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  width: width,
                  child: CachedNetworkImage(
                      fit: BoxFit.cover, imageUrl: widget.restaurant!.imageUrl),
                ),
                Positioned(
                    bottom: 0,
                    child: RestaurantBottomBar(restaurant: widget.restaurant)),
                Positioned(
                    top: 40.h,
                    left: 0,
                    right: 0,
                    child: RestaurantTopBar(restaurant: widget.restaurant))
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children:  [
                  RowText(first: "Distance to Restaurant", second: "2.7 km",),
                  RowText(first: "Estimated Price", second: "\$2.7",),
                  RowText(first: "Estimated Time", second: "30 min",),

                  Divider(
                    thickness: 0.7,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
