import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp/repo/register_repo.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/custom_snackbar.dart';
import '../../utils/storage_keys.dart';
import '../../views/dashboard/home_page.dart';
import '../core_controller.dart';

class SignUpController extends GetxController {
  final key = GlobalKey<FormState>();
  RxBool passwordObscure = true.obs;
  RxBool passwordObscure2 = true.obs;

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
  final Rx<String?> memberImageUrl = Rx<String?>(null);

  var userType = '1'.obs;

  void changeUserType(String value) {
    userType.value = value;
  }

  void onEyeCLick() {
    passwordObscure.value = !passwordObscure.value;
    print("Password obscure: ${passwordObscure.value}");
  }

  void onEyeCLick2() {
    passwordObscure2.value = !passwordObscure2.value;
    print("Password obscure: ${passwordObscure2.value}");
  }

  final picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // You can upload the image to a server or store the file path locally
      memberImageUrl.value = pickedFile.path;
    }
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
          memberHeight: memberHeightController.text.toString(),
          memberWeight: memberWeightController.text.toString(),
          // memberImageUrl: memberImageUrl.value,
          memberType: userType.value,
          onSuccess: (user, token) async {
            // loading.hide();
            final box = GetStorage();
            await box.write(StorageKeys.USER, json.encode(user.toJson()));
            await box.write(StorageKeys.ACCESS_TOKEN, token.toString());
            Get.find<CoreController>().loadCurrentUser();
            Get.offAll(HomePage());
            CustomSnackBar.success(title: "Registered Successfully", message: "Registered Successfully");
          },
          onError: (message) {
            // loading.hide();
            CustomSnackBar.error(
                title: "Error", message: message);
          });
    }
  }
}
