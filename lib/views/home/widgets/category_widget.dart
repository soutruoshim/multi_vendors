import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../common/app_style.dart';
import '../../../common/reusable_text.dart';
import '../../../constants/constants.dart';
import '../../../controllers/category_controller.dart';
import '../../../models/categories.dart';
import '../../categories/all_categories.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    super.key,
    required this.category,
  });

  CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return GestureDetector(
        onTap: () {
          if (controller.categoryValue == category.id) {
            controller.updateCategory = '';
            controller.updateTitle = '';
          } else if (category.value == 'more') {
            Get.to(() => const AllCategories(),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 900));
          } else {
            controller.updateCategory = category.id;
            controller.updateTitle = category.title;
          }
        },
        child: Obx(() => Container(
          margin: EdgeInsets.only(right: 5.w),
          padding: EdgeInsets.only(top: 4.h),
          width: width * 0.19,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: controller.categoryValue == category.id ? kSecondary : kOffWhite, width: .5.w)),
          child: Column(
            children: [
              SizedBox(
                height: 35.h,
                width: 35.h, // or any width you want, maybe 35.w if you're using flutter_screenutil
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    category.imageUrl,
                    fit: BoxFit.fill, // or BoxFit.contain depending on your preference
                  ),
                ),
              ),
              ReusableText(
                  text: category.title,
                  style: appStyle(12, kDark, FontWeight.normal))
            ],
          ),
        ),
        ));
  }
}