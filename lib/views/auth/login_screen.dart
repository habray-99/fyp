import 'package:cached_network_image/cached_network_image.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              // const SizedBox(
              //   height: 300,
              // child: Image(
              Image(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
              ),
              // ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                child: Column(
                  children: [
                    Text(
                      "Welcome Back",
                      style: CustomTextStyles.f12W600(color: Colors.black87),
                    ),
                    Text(
                      "Login in to continue",
                      style: CustomTextStyles.f10W300(color: Colors.black87),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
