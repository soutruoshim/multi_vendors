import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_venors/common/app_style.dart';
import 'package:multi_venors/common/tab_widget.dart';
import 'package:multi_venors/constants/constants.dart';

class OrdersTabs extends StatelessWidget {
  const OrdersTabs({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TabBar(
          controller: _tabController,
          isScrollable: true,
          dividerColor: Colors.transparent,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: kPrimary),
          labelColor: Colors.white,
          labelStyle: appStyle(12, kLightWhite, FontWeight.normal),
          unselectedLabelColor: kGrayLight,
          tabAlignment: TabAlignment.start,
          tabs: List.generate(
              orderList.length, (i) => TabWidget(text: orderList[i]))),
    );
  }
}
