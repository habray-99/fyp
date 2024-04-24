import 'package:flutter/material.dart';
import 'package:fyp/controller/core_controller.dart';
import 'package:fyp/model/user_detail.dart';
import 'package:fyp/utils/apis.dart';
import 'package:fyp/views/dashboard/Memberships_page.dart';
import 'package:fyp/views/dashboard/all_gyms_list.dart';
import 'package:fyp/views/dashboard/calories_calculator_page.dart';
import 'package:fyp/views/dashboard/edit_user_detail.dart';
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
          backgroundColor:
              Colors.transparent, // This makes the AppBar transparent
          elevation: 0.0, // This removes the shadow below the AppBar
        ),
        drawer: Drawer(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  // color: Color.fromARGB(255, 113, 201, 206),
                  // color: Color.fromRGBO(113, 201, 206, 1),
                  color: Colors.cyanAccent[700],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _profileImage(c.currentUser.value!),
                    const SizedBox(height: 15),
                    // Obx(
                    //   () => Text(
                    //     c.currentUser.value!.memberName != null
                    //         ? c.currentUser.value!.memberName!.split(' ').first
                    //         : 'unknown',
                    //     style: const TextStyle(
                    //       color: Color(0xFFFAFAFA),
                    //     ),
                    //   ),
                    // ),
                    Obx(
                      () => Text(
                        c.currentUser.value?.memberName != null
                            ? c.currentUser.value!.memberName!.split(' ').first
                            : 'unknown',
                        style: const TextStyle(
                          color: Color(0xFFFAFAFA),
                        ),
                      ),
                    ),

                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => EditProfilePage(user: c.currentUser.value!),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.edit, color: Color(0xFFFAFAFA)),
                          SizedBox(width: 5),
                          Text(
                            'Edit',
                            style: TextStyle(
                              color: Color(0xFFFAFAFA),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Text("Browse Gyms",
                    style: TextStyle(color: Color(0xFF343434))),
                onTap: () {
                  Get.to(() => const GymListPage());
                },
              ),
              ListTile(
                title: const Text('Calories Calculator',
                    style: TextStyle(color: Color(0xFF343434))),
                onTap: () {
                  Get.to(() => const CaloriesCalculatorPage());
                },
              ),
              ListTile(
                title: const Text('Get Motivated',
                    style: TextStyle(color: Color(0xFF343434))),
                onTap: () {
                  Get.to(() => QuoteListPage());
                },
              ),
              ListTile(
                title: const Text('Generate Exercise Plan',
                    style: TextStyle(color: Color(0xFF343434))),
                onTap: () {
                  Get.to(() => ExerciseSelectionPage());
                },
              ),
              ListTile(
                title: const Text("Memberships",
                    style: TextStyle(color: Color(0xFF343434))),
                onTap: () {
                  Get.to(() => const PaymentsListView());
                },
              ),
              Divider(
                // thickness: ,
                // color: Color(0xFF343434),
                color: Colors.grey.shade800,
              ),
              ListTile(
                title: const Text("Settings",
                    style: TextStyle(color: Color(0xFF343434))),
                onTap: () {
                  Get.to(() => EditProfilePage(user: c.currentUser.value!));
                },
              ),
              ListTile(
                title: const Text("Logout",
                    style: TextStyle(color: Color(0xFF343434))),
                onTap: () {
                  c.logOut();
                },
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Welcome ${c.currentUser.value?.memberName?.split(' ').first ?? ''}",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: const Color(0xFF343434)),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 20),
                const Center(child: NfcGeneratorAnimation()),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    // color: const Color(0xFFC8C8C8),
                    color: const Color(0xFFE1E1E1),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Generate Your Personalized Exercise Regime",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: const Color(0xFF343434)),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Create an exercise regime that's perfectly suited to your goals, preferences, and schedule. You can easily adjust and refine it as you progress.",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: const Color(0xFF343434)),
                      ),
                      const SizedBox(height: 16.0),
                      CustomElevatedButton(
                        title: "Generate Regime",
                        textColor: const Color(0xFF343434),
                        onTap: () {
                          Get.to(() => ExerciseSelectionPage());
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE1E1E1),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Find Your Perfect Calorie Intake",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: const Color(0xFF343434)),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Uncover the perfect calorie intake that perfectly suits your body's needs and helps you achieve your health goals.",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: const Color(0xFF343434)),
                      ),
                      const SizedBox(height: 16.0),
                      CustomElevatedButton(
                        title: "Calculate Your Intake",
                        onTap: () {
                          Get.to(() => const CaloriesCalculatorPage());
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE1E1E1),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Are You Feeling Low or Unmotivated?",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: const Color(0xFF343434)),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Struggling with motivation? Discover inspiring quotes and tips in our \"Get Motivated\" section to help you regain your drive.",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: const Color(0xFF343434)),
                      ),
                      const SizedBox(height: 16.0),
                      CustomElevatedButton(
                        title: "Find Inspiration",
                        onTap: () {
                          Get.to(() => QuoteListPage());
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileImage(Users user) {
    return CircleAvatar(
      radius: 30,
      child: ClipOval(
        child: user.memberImageUrl != null
            ? Image.network(
                "${Apis.imageUrl}/${user.memberImageUrl!}",
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              )
            : Image.asset(
                'assets/images/default_profile_image.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
