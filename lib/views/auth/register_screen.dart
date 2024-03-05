import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/auth/sign_up_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const String routeName = "/registerScreen";

  final c = Get.lazyPut(SignUpController() as InstanceBuilderCallback);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(
                //   height: 20,
                // ),
                _gymImgAndGreet(),
                _nameBuilder(),
                _emailBuilder(),
                _phoneBuilder(),
                _addressBuilder(),
                _passwordBuilder(),
                _rePasswordBuilder(),
                _heightBuilder(),
                _weightBuilder(),
                _signUp(),
                _otherMethods(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _gymImgAndGreet() {
    return;
  }

  Widget _nameBuilder() {
    return;
  }

  Widget _emailBuilder() {
    return;
  }

  Widget _phoneBuilder() {
    return;
  }

  Widget _addressBuilder() {
    return;
  }

  Widget _passwordBuilder() {
    return;
  }

  Widget _rePasswordBuilder() {
    return;
  }

  Widget _heightBuilder() {
    return;
  }

  Widget _weightBuilder() {
    return;
  }

  Widget _signUp() {
    return;
  }

  Widget _otherMethods() {
    return;
  }
}
