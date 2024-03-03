import 'package:flutter/material.dart';
import 'package:fyp/controller/auth/login_controller.dart';
import 'package:fyp/utils/colors.dart';
import 'package:fyp/utils/custom_text_style.dart';
import 'package:get/get.dart';

class LogInScreen extends StatelessWidget {
  static const String routeName = "/loginScreen";

  LogInScreen({super.key});
  final c = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          
        ),
      ),
    );
  }
}
