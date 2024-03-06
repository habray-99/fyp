import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fyp/utils/validators.dart';
import 'package:fyp/views/auth/login_screen.dart';
import 'package:fyp/views/dashboard/home_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/auth/sign_up_controller.dart';
import '../../widgets/custom/custom_elevated_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static const String routeName = "/registerScreen";

  final c = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: SingleChildScrollView(
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
      ),
    );
  }

  Widget _gymImgAndGreet() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5), // Adjust the border radius as needed
          child: CachedNetworkImage(imageUrl:
            "https://images.unsplash.com/photo-1577221084712-45b0445d2b00?q=80&w=1898&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            // height: 300, // Consider setting a fixed height or using AspectRatio for better control
            fit: BoxFit.cover, // Use BoxFit.cover to ensure the image covers the entire container
            placeholder: (context, url) => const CircularProgressIndicator(), // Optional: Show a loading indicator while the image is loading
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        const SizedBox(
          height: 20, // Adjust the height as needed
        ),
        const ListTile(
          title: Text(
            "Welcome to Gym",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "Please fill the form to register",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }


  // Widget _gymImgAndGreet() {
  //   return Column(
  //     children: [
  //       Image.network(
  //         "https://images.unsplash.com/photo-1577221084712-45b0445d2b00?q=80&w=1898&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  //         // height: 300,
  //       ),
  //       // const SizedBox(
  //       //   height: 20,
  //       // ),
  //       const SizedBox(
  //         // height: 200,
  //         child: ListTile(
  //           title: Text(
  //             "Welcome to Gym",
  //             style: TextStyle(
  //               fontSize: 30,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //           subtitle: Text(
  //             "Please fill the form to register",
  //             style: TextStyle(
  //               fontSize: 20,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _nameBuilder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: c.memberNameController,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: "Name",
          hintText: "Enter your name",
          hintStyle: TextStyle(color: Colors.black38),
          // prefixIcon: const Icon(Icons.person),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _emailBuilder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: c.memberEmailController,
        validator: Validators.checkEmailField,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          hintStyle: TextStyle(color: Colors.black38),
          // prefixIcon: const Icon(Icons.email),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _phoneBuilder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: c.memberPhoneController,
        validator: Validators.checkPhoneField,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: "Phone",
          hintText: "Enter your phone",
          hintStyle: TextStyle(color: Colors.black38),
          // prefixIcon: const Icon(Icons.phone),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _addressBuilder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: c.memberAddressController,
        validator: Validators.checkFieldEmpty,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: "Address",
          hintText: "Enter your address",
          hintStyle: TextStyle(color: Colors.black38),
          // prefixIcon: const Icon(Icons.location_on),
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
          controller: c.memberPasswordController,
          obscureText: c.passwordObscure.value,
          textInputAction: TextInputAction.next,
          validator: Validators.checkPasswordField,
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            hintStyle: TextStyle(color: Colors.black38),
            // prefixIcon: const Icon(Icons.lock),
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

  Widget _rePasswordBuilder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () => TextFormField(
          controller: c.rePasswordController,
          obscureText: c.passwordObscure2.value,
          textInputAction: TextInputAction.next,
          validator: Validators.checkPasswordField,
          decoration: InputDecoration(
            labelText: "Re enter Password",
            hintText: "ReEnter your password",
            hintStyle: TextStyle(color: Colors.black38),
            // prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              onPressed: () {
                c.onEyeCLick2();
              },
              icon: c.passwordObscure2.value
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

  // Widget _rePasswordBuilder() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: TextFormField(
  //       controller: c.rePasswordController,
  //       decoration: InputDecoration(
  //         labelText: "Re-Password",
  //         hintText: "Re-Enter your password",
  //         prefixIcon: const Icon(Icons.lock),
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _heightBuilder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: c.memberHeightController,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: "Height",
          hintText: "Enter your height",
          hintStyle: TextStyle(color: Colors.black38),
          // prefixIcon: const Icon(Icons.height),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _weightBuilder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: c.memberWeightController,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          labelText: "Weight",
          hintText: "Enter your weight",
          hintStyle: TextStyle(color: Colors.black38),
          // prefixIcon: const Icon(Icons.line_weight),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _signUp() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomElevatedButton(
          title: "Sign up",
          onTap: () {
            // Get.offAll(HomePage());
          }),
    );
  }
  // Widget _signUp() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: SizedBox(
  //       width: double.infinity,
  //       child: ElevatedButton(
  //         onPressed: () {
  //           c.onSubmit();
  //         },
  //         child: const Text("Sign Up"),
  //       ),
  //     ),
  //   );
  // }

  Widget _otherMethods() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Already have an account?"),
          TextButton(
            onPressed: () {
              // Get.put(() => LogInScreen());
              Get.back();
            },
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }
}
