import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp/controller/core_controller.dart';
import 'package:fyp/repo/login_repo.dart';
import 'package:fyp/utils/custom_snackbar.dart';
import 'package:fyp/utils/storage_keys.dart';
import 'package:fyp/views/dashboard/home_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
// import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class LoginController extends GetxController {
  final key = GlobalKey<FormState>();
  RxBool passwordObscure = true.obs;

  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  RxBool isChecked = false.obs;
  void onEyeCLick() {
    passwordObscure.value = !passwordObscure.value;
    print("Password obscure: ${passwordObscure.value}");
  }

  void onSubmit() async {
    if (key.currentState!.validate()) {
      loading.show(
        message: 'Please wait',
        hideText: true,
      );
      LoginRepo.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        onSuccess: (user, token) async {
          loading.hide();
          final box = GetStorage();
          await box.write(StorageKeys.USER, json.encode(user.toJson()));
          await box.write(StorageKeys.ACCESS_TOKEN, token);
          Get.find<CoreController>().loadCurrentUser();
          Get.offAll(() => HomePage());
          CustomSnackBar.success(title: "Login", message: "Login Successful");
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "Login", message: message);
        },
      );
    }
  }
}
