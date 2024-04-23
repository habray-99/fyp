import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fyp/controller/auth/login_controller.dart';
import 'package:fyp/utils/validators.dart';
import 'package:fyp/views/auth/register_screen.dart';
import 'package:fyp/views/dashboard/home_page.dart';
import 'package:fyp/widgets/custom/custom_elevated_button.dart';
import 'package:get/get.dart';

class LogInScreen extends StatefulWidget {
  static const String routeName = "/loginScreen";

  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
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
                Form(
                  key: c.key,
                  child: Column(
                    children: [
                      _emailBuilder(),
                      _passwordBuilder(),
                      _remberMeAndForgotPassword(),
                      _loginButton(),
                    ],
                  ),
                ),
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
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                spreadRadius: 2,
                color: Colors.black12, // Adjust the color and opacity as needed
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl:
                  "https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              // height: 300, // Consider setting a fixed height or using AspectRatio for better control
              fit: BoxFit
                  .cover, // Use BoxFit.cover to ensure the image covers the entire container
              placeholder: (context, url) =>
                  const CircularProgressIndicator(), // Optional: Show a loading indicator while the image is loading
              errorWidget: (context, url, error) => const Icon(Icons
                  .error), // Optional: Show an error icon if the image fails to load
              // // ),
              // child: Image(
              //   image: AssetImage("assets/images/logo.svg",),
              // ),
              // child: ClipRRect(
              //   borderRadius: BorderRadius.circular(10),
              //   child: const Image(
              //     image: AssetImage("assets/images/logo.jpg"),
              //     fit: BoxFit
              //         .cover, // Use BoxFit.cover to ensure the image covers the entire container
              //   ),
              // ),
            ),
          ),
        ),
        const SizedBox(
          height: 20, // Adjust the height as needed
        ),
        const ListTile(
          title: Text(
            "Welcome",
            style: TextStyle(color: Color.fromRGBO(52, 52, 52, 1)),
          ),
          subtitle: Text(
            "Login in to continue",
            style: TextStyle(color: Color.fromRGBO(52, 52, 52, 1)),
          ),
        ),
      ],
    );
  }

  Widget _otherMethods() {
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
            onPressed: () {
              Get.offAll(() => HomePage());
            },
          )
        ],
      ),
    );
  }

  // Widget _signUp() {
  Widget _signUp() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Don't have an account?",
            style: TextStyle(color: Color.fromRGBO(52, 52, 52, 1)),
          ),
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
            // Get.offAll(() => HomePage());
            c.onSubmit();
          }),
    );
  }

  // Widget _loginButton(){
  Widget _emailBuilder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: c.emailController,
        validator: Validators.checkEmailField,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          hintStyle: const TextStyle(
            color: Color.fromRGBO(52, 52, 52, .6),
          ),
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
          // validator: Validators.checkPasswordField,
          obscureText: c.passwordObscure.value,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            hintStyle: const TextStyle(
              // color: Color.fromRGBO(52, 52, 52, .6),
              color: Color.fromRGBO(52, 52, 52, .6),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                c.onEyeCLick();
              },
              icon: c.passwordObscure.value
                  ? const Icon(
                      Icons.visibility_off,
                      // color: Color.fromRGBO(166, 227, 233, 1),
                      color: Colors.black54,
                    )
                  : const Icon(
                      Icons.visibility,
                      // color: Color.fromRGBO(166, 227, 233, 1),
                      color: Colors.black87,
                    ),
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
