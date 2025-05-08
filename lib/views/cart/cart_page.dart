import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_venors/common/custom_container.dart';
import 'package:multi_venors/constants/constants.dart';
import 'package:multi_venors/controllers/login_controller.dart';
import 'package:multi_venors/models/login_response.dart';
import 'package:multi_venors/views/auth/login_redirect.dart';
import 'package:multi_venors/views/auth/verification_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    LoginResponse? user;

    final controller = Get.put(LoginController());

    String? token = box.read('token');

    if (token != null) {
      user = controller.getUserInfo();
    }

    if (token == null) {
      return const LoginRedirect();
    }

    if (user != null && user.verification == false) {
      return const VerificationPage();
    }

    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h),
          child: Container(
            height: 130,
          )),
      body: SafeArea(
        child: CustomContainer(containerContent: Container()),
      ),
    );
  }
}
