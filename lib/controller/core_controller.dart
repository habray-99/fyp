

import 'package:get/get.dart';


class CoreController extends GetxController {
  // Rx<UserDetail?> currentUser = Rxn<UserDetail>();
  // RxString userToken = "".obs;
  // @override
  // void onInit() async {
  //   await loadCurrentUser();
  //   super.onInit();
  // }

  // Future<void> loadCurrentUser() async {
  //   // currentUser.value = StorageHelper.getUser();
  //   userToken.value = StorageHelper.getToken();
  //   log("current user----------------------- ${currentUser.value?.email}-");
  //   log("current user token----------------------- ${userToken.value}-");
  // }

  // bool isUserLoggedIn() {
  //   return currentUser.value != null;
  // }

  // void logOut() async {
  //   final box = GetStorage();
  //   // await box.write(StorageKeys.ACCESS_TOKEN, null);
  //   await box.write(StorageKeys.USER, null);
  //   loadCurrentUser();
  //   // Get.offAll(() => LogInScreen());
  // }
}
