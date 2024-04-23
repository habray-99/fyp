import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final c = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade700,
      body: Column(
        children: [
          Center(
            child: SizedBox(
              child: Image(
                image: const AssetImage('assets/images/output-onlinepngtools.png'),
                //   // ImagePath.loginBackGround,
                //   // CachedNetworkImage(imageUrl: "https://images.unsplash.com/photo-1709403338549-10e6b0e24c3f?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",)

                //   // ImagePath.splashLogo,
                // ),
                // image: NetworkImage(
                //     "https://images.unsplash.com/photo-1709403338549-10e6b0e24c3f?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                // height: 200,
                // width: 200,
                height: Get.height * .5,
                width: Get.width * .5,
              ),
            ),
          ),
          const CircularProgressIndicator()
        ],
      ),
    );
  }
}
