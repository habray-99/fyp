import 'dart:developer';

import 'package:fyp/model/user_detail.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/storage_keys.dart';
import '../views/auth/login_screen.dart';

class CoreController extends GetxController {
  Rx<Users?> currentUser = Rxn<Users>();
  RxString userToken = "".obs;
  @override
  void onInit() async {
    await loadCurrentUser();
    super.onInit();
  }

  Future<void> loadCurrentUser() async {
    currentUser.value = StorageHelper.getUser();
    // userToken?.value = StorageHelper.getToken();
    // log("current user----------------------- ${currentUser.value?.memberEmail}-");
    // log("current user token----------------------- ${userToken.value}-");
    // log("current user token----------------------- ${currentUser.value?.memberToken}-");
  }

  bool isUserLoggedIn() {
    return currentUser.value != null;
  }

  void logOut() async {
    final box = GetStorage();
    await box.write(StorageKeys.ACCESS_TOKEN, null);
    await box.write(StorageKeys.USER, null);
    loadCurrentUser();
    Get.offAll(() => LogInScreen());
  }
}
