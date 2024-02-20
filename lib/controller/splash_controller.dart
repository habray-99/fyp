import 'dart:async';

import 'package:get/get.dart';

import '../views/dashboard/home_page.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 4), () async {
      Get.offAll(const HomePage());
    });
    super.onInit();
  }
  // final c = Get.put(CoreController());
  // @override
  // void onInit() {
  //   Timer(const Duration(seconds: 4), () async {
  //     if (c.isUserLoggedIn()) {
  //       // Get.offAll();
  //     } else {
  //       // Get.offAll(LogInScreen());
  //     }
  //   });
  //   super.onInit();
  // }
}
