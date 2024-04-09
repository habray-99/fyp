import 'package:flutter/material.dart';

import 'package:fyp/views/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

import 'controller/core_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: "test_public_key_f18b878e02d64e10988f46aea7baa233",
      builder: (context, navigatorKey) {
        return GetMaterialApp(
          navigatorKey: navigatorKey,
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ne', 'NP'),
          ],
          localizationsDelegates: const [
            KhaltiLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: true,
          title: 'My project',
          theme: ThemeData(
            colorScheme:
                // ColorScheme(brightness: Color, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface),
                ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(248, 248, 255, .7),
            ),
            useMaterial3: true,
          ),
          initialBinding: BindingsBuilder(() {
            Get.put(CoreController());
          }),
          home: SplashScreen(),
        );
      },
    );
  }
}
