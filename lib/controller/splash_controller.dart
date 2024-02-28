import 'dart:async';

import 'package:fyp/controller/core_controller.dart';
import 'package:fyp/views/auth/login_screen.dart';
import 'package:get/get.dart';

import '../views/dashboard/home_page.dart';

class SplashScreenController extends GetxController {
  // @override
  // void onInit() {
  //   Timer(const Duration(seconds: 4), () async {
  //     Get.offAll(const HomePage());
  //   });
  //   super.onInit();
  // }
  final c = Get.put(CoreController());
  @override
  void onInit() {
    Timer(const Duration(seconds: 4), () async {
      if (c.isUserLoggedIn()) {
        Get.offAll(const HomePage());
      } else {
        Get.offAll(const LogInScreen());
      }
    });
    super.onInit();
  }
}
