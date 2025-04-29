import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/shimmers/categories_shimmer.dart';
import '../../../hooks/fetch_categories.dart';
import '../../../models/categories.dart';
import 'category_widget.dart';

class CategoryList extends HookWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {

    final hookResult = useFetchCategories();
    List<CategoriesModel>? categoriesList = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;

    print(categoriesList);
    return Container(
      height: 80.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: isLoading
          ? const CatergoriesShimmer()
          : ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(categoriesList!.length, (i) {
          CategoriesModel category = categoriesList[i];
          return CategoryWidget(category: category);
        }),
      ),
    );
  }
}