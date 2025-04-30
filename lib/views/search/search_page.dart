import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:multi_venors/common/custom_container.dart';
import 'package:multi_venors/common/custom_text_field.dart';
import 'package:multi_venors/common/shimmers/foodlist_shimmer.dart';
import 'package:multi_venors/constants/constants.dart';
import 'package:multi_venors/controllers/search_controller.dart';
import 'package:multi_venors/views/search/loading_widget.dart';
import 'package:multi_venors/views/search/search_results.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    return Obx(() => Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        toolbarHeight: 74.h,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: CustomTextWidget(
            controller: _searchController,
            keyboardType: TextInputType.text,
            hintText: "Search For Foods",
            suffixIcon: GestureDetector(
                onTap: () {
                  controller.searchFoods(_searchController.text);
                },
                child:
                Icon(Ionicons.search_circle, size: 40.h, color: kGray)),
          ),
        ),
      ),
      body: SafeArea(
        child: CustomContainer(
            color: Colors.white,
            containerContent: controller.isLoading
                ? const FoodsListShimmer()
                : controller.searchResults == null ? const LoadingWidget()
                : const SearchResults()),
      ),
    ));
  }
}
