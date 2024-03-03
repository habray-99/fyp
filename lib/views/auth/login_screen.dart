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
      body: SingleChildScrollView(
        child: Padding(
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
                  // height: 200,
                  child: ListTile(
                    title: const Text(
                      "Welcome",
                      style: TextStyle(color: Colors.black87),
                    ),
                    subtitle: const Text(
                      "Sign in to continue",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ),
                _emailBuilder(),
                _passwordBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailBuilder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: c.emailController,
        decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _passwordBuilder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () => TextFormField(
          controller: c.passwordController,
          obscureText: c.passwordObscure.value,
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            suffixIcon: IconButton(
              onPressed: () {
                c.onEyeCLick();
              },
              icon: c.passwordObscure.value
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
