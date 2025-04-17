import 'package:flutter/material.dart';

import '../../common/app_style.dart';
import '../../common/reusable_text.dart';
import '../../constants/constants.dart';

class AllFastestFoods extends StatelessWidget {
  const AllFastestFoods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: kOffWhite,
        title: ReusableText(text: "Fastest Foods",
            style: appStyle(13, kGray, FontWeight.w600)),
      ),
      body: const Center(
        child: Text("All Fastest Foods"),
      ),
    );
  }
}