import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/app_style.dart';
import '../../../common/reusable_text.dart';
import '../../../constants/constants.dart';
import '../category_page.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({
    super.key,
    required this.category,
  });

  var category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(() =>const CategoryPage(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 900));
      },
      leading: CircleAvatar(
        radius: 18.r,
        backgroundColor: kGrayLight,
        child:
        SizedBox(
          height: 35.h,
          width: 35.h, // or any width you want, maybe 35.w if you're using flutter_screenutil
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              category['imageUrl'],
              fit: BoxFit.fill, // or BoxFit.contain depending on your preference
            ),
          ),
        ),
      ),
      title: ReusableText(
          text: category['title'],
          style: appStyle(12, kGray, FontWeight.normal)),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: kGray,
        size: 15.r,
      ),
    );
  }
}