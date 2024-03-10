import 'package:flutter/material.dart';
import 'package:fyp/views/auth/login_screen.dart';
// import 'package:fyp/views/auth/login_screen.dart';
import 'package:fyp/views/splash_screen.dart';
// import 'package:fyp/views/splash_screen.dart';
import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';

import 'controller/core_controller.dart';
import 'views/auth/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fyp App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(CoreController());
      }),
      // home: SplashScreen(),
      // home: RegisterScreen(),
      home: LogInScreen(),
    );
  }
}
