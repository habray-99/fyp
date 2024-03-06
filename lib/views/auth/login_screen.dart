import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fyp/controller/auth/login_controller.dart';
import 'package:fyp/utils/colors.dart';
import 'package:fyp/utils/custom_text_style.dart';
import 'package:fyp/views/auth/register_screen.dart';
import 'package:fyp/widgets/custom/custom_elevated_button.dart';

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
                // const SizedBox(
                //   height: 20,
                // ),
                _gymImgAndGreet(),
                _emailBuilder(),
                _passwordBuilder(),
                _remberMeAndForgotPassword(),
                _loginButton(),
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
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl:
              "https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          // height: 300,
        ),
        // const SizedBox(
        //   height: 20,
        // ),
        const SizedBox(
          // height: 200,
          child: ListTile(
            title: Text(
              "Welcome",
              style: TextStyle(color: Colors.black87),
            ),
            subtitle: Text(
              "Login in to continue",
              style: TextStyle(color: Colors.black87),
            ),
          ),
        ),
      ],
    );
  }

  Widget _otherMethods() {
    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       const Text("Or login with"),
    //       const SizedBox(
    //         width: 10,
    //       ),
    //       CachedNetworkImage(
    //         imageUrl: "https://img.icons8.com/color/452/google-logo.png",
    //         height: 30,
    //         width: 30,
    //       ),
    //       const SizedBox(
    //         width: 10,
    //       ),
    //       CachedNetworkImage(
    //         imageUrl: "https://img.icons8.com/color/452/facebook-new.png",
    //         height: 30,
    //         width: 30,
    //       ),
    //     ],
    //   ),
    // );
    return Center(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SignInButton(
            Buttons.Google,
            onPressed: () {},
          ),
          SignInButton(
            Buttons.Facebook,
            onPressed: () {},
          ),
          SignInButton(
            Buttons.Email,
            text: "Skip",
            onPressed: () {},
          )
        ],
      ),
    );
  }

  // Widget _signUp() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         const Text("Don't have an account?"),
  //         TextButton(
  //           onPressed: () {
  //             // Get.toNamed("/registerScreen");
  //             Get.lazyPut(() => RegisterScreen());
  //           },
  //           child: const Text("Sign Up"),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _signUp() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Don't have an account?"),
          TextButton(
            onPressed: () {
              Get.to(() => RegisterScreen());
            },
            child: const Text("Sign Up"),
          ),
        ],
      ),
    );
  }

  Widget _remberMeAndForgotPassword() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Obx(
                () => Checkbox(
                  value: c.isChecked.value,
                  onChanged: (value) {
                    c.isChecked.value = value!;
                  },
                ),
              ),
              const Text("Remember me"),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Forgot Password?"),
          ),
        ],
      ),
    );
  }

  Widget _loginButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomElevatedButton(
          title: "Login",
          onTap: () {
            Get.lazyPut(() => RegisterScreen());
          }),
    );
  }
  // Widget _loginButton(){
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: SizedBox(
  //       width: double.infinity,
  //       child: ElevatedButton(
  //         onPressed: () {
  //           c.onSubmit();
  //         },
  //         child: const Text("Login"),
  //       ),
  //     ),
  //   );
  // }

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
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
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
