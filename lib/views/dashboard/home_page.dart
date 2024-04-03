import 'package:flutter/material.dart';
import 'package:fyp/controller/core_controller.dart';
import 'package:fyp/views/dashboard/all_gyms_list.dart';
import 'package:fyp/views/dashboard/calories_calculator_page.dart';
import 'package:fyp/views/dashboard/exercise_selection_page.dart';
import 'package:fyp/views/dashboard/nfc_generator_animation.dart';
import 'package:fyp/views/dashboard/quote_list_page.dart';
import 'package:fyp/widgets/custom/custom_elevated_button.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final c = Get.put(CoreController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            // title: const Text("Home Page"),
            ),
        // body: Center(child: CustomElevatedButton(title: "Log Out", onTap: () {c.logOut();})),
        drawer: Drawer(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text("Browse Gyms"),
                onTap: () {
                  Get.to(() => const GymListPage());
                },
              ),
              ListTile(
                title: const Text('Calories Calculator'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  // Get.to(() => QuoteListPage());
                  Get.to(() => const CaloriesCalculatorPage());
                },
              ),
              ListTile(
                title: const Text('Get Motivated'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Get.to(() => QuoteListPage());
                },
              ),
              ListTile(
                title: const Text('Generate Exercise Plan'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Get.to(() => ExerciseSelectionPage());
                },
              ),
              ListTile(
                title: const Text("Settings"),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Logout"),
                onTap: () {
                  c.logOut();
                },
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "Welcome ${c.currentUser.value?.memberName?.split(' ').first}",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                // subtitle: Text(
                // "You are logged in as ${c.currentUser.value?.memberName}"),
                // ),
              ),
              const SizedBox(
                height: 20 * 2,
              ),
              const Center(
                child: NfcGeneratorAnimation(),
              ),
              const SizedBox(
                height: 20 * 2,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                // color: const Color(0xffE6E49F), // Background color
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create a customized exercise plan that aligns with your preferences, which you can modify at any time and adjust based on your feedback.",
                      style: TextStyle(
                        color: const Color(0xFF020202),
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium?.fontSize,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                        height:
                            16), // Add some space between the text and the button
                    // ElevatedButton(
                    //   onPressed: () {
                    //     // Implement the action for the "Generate" button
                    //   },
                    //   child: const Text("Generate"),
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor:
                    //         const Color(0xFFBDC2BF), // Button background color
                    //   ),
                    // ),
                    CustomElevatedButton(
                        title: "Generate",
                        onTap: () {
                          Get.to(() => ExerciseSelectionPage());
                        }),
                  ],
                ),
              ),

              // ListTile()
              Container(
                padding: const EdgeInsets.all(16),
                color: const Color(0xFF989C94), // Background color
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Discover the ideal calorie intake that matches your body's needs.",
                      style: TextStyle(
                        color: Color(0xFF020202), // Text color
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                        height:
                            16), // Add some space between the text and the button
                    // ElevatedButton(
                    //   onPressed: () {
                    //     // Implement the action for the "Generate" button
                    //   },
                    //   child: Text("Calculate"),
                    //   style: ElevatedButton.styleFrom(
                    //       // primary: Color(0xFFBDC2BF), // Button background color
                    //       ),
                    // ),
                    CustomElevatedButton(
                        title: "Calculate",
                        onTap: () {
                          Get.to(() => const CaloriesCalculatorPage());
                        }),
                  ],
                ),
              ),
              const SizedBox(
                height: 20 * 2,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                color: const Color(0xFF989C94), // Background color
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Feeling unmotivated? Boost your spirits with our \"Get Motivated\" section.",
                      style: TextStyle(
                        color: Color(0xFF020202), // Text color
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                        height:
                            16), // Add some space between the text and the button
                    // ElevatedButton(
                    //   onPressed: () {
                    //     // Implement the action for the "Generate" button
                    //   },
                    //   child: Text("Calculate"),
                    //   style: ElevatedButton.styleFrom(
                    //       // primary: Color(0xFFBDC2BF), // Button background color
                    //       ),
                    // ),
                    CustomElevatedButton(
                        title: "Get Motivated",
                        onTap: () {
                          Get.to(() => QuoteListPage());
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
