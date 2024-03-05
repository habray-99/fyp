import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp/repo/register_repo.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/custom_snackbar.dart';
import '../../utils/storage_keys.dart';
import '../../views/dashboard/home_page.dart';
import '../core_controller.dart';

class SignUpController extends GetxController {
  final key = GlobalKey<FormState>();
  RxBool passwordObscure = true.obs;

  final memberNameController = TextEditingController();
  final memberEmailController = TextEditingController();
  final memberPhoneController = TextEditingController();
  final memberAddressController = TextEditingController();
  final memberPasswordController = TextEditingController();
  final rePasswordController = TextEditingController();
  final memberHeightController = TextEditingController();
  final memberWeightController = TextEditingController();
  final memberTokenController = TextEditingController();
  final memberTypeController = TextEditingController();
  final tokenExpiryController = TextEditingController();

  void onEyeCLick() {
    passwordObscure.value = !passwordObscure.value;
    print("Password obscure: ${passwordObscure.value}");
  }

  void onSubmit() async {
    if (key.currentState!.validate()) {
      // loading.show(
      //   message: 'Please wait',
      //   hideText: true,
      // );
      await RegisterRepo.register(
          memberName: memberNameController.text,
          memberEmail: memberEmailController.text,
          memberPhone: memberPhoneController.text,
          memberAddress: memberAddressController.text,
          memberPassword: memberPasswordController.text,
          memberHeight: memberHeightController.text,
          memberWeight: memberWeightController.text,
          memberToken: memberTokenController.text,
          tokenExpiry: tokenExpiryController.text,
          onSuccess: (user, token) async {
            // loading.hide();
            final box = GetStorage();
            await box.write(StorageKeys.USER, json.encode(user.toJson()));
            await box.write(StorageKeys.ACCESS_TOKEN, token.toString());
            Get.find<CoreController>().loadCurrentUser();
            Get.offAll(() => const HomePage());
            CustomSnackBar.success(title: "Login", message: "Login Successful");
          },
          onError: (message){
            // loading.hide();
            CustomSnackBar.error(title: "Registered Successfully", message: message);
          }
          );
    }
  }
}
