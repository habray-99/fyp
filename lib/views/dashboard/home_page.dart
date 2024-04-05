import 'package:flutter/material.dart';
import 'package:fyp/controller/core_controller.dart';
import 'package:fyp/model/user_detail.dart';
import 'package:fyp/utils/apis.dart';
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
        // appBar: AppBar(
        //     // title: const Text("Home Page"),
        //     ),
        appBar: AppBar(
          title: const Text("Home"),
          centerTitle: true,
        ),
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
              // DrawerHeader(
              //   decoration: const BoxDecoration(
              //     color: Colors.blue,
              //   ),
              //   child: _profileImage(c.currentUser.value!),
              // ),
              // DrawerHeader(
              //   decoration: const BoxDecoration(
              //     color: Colors.blue,
              //   ),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       _profileImage(c.currentUser
              //           .value!), // Your existing profile image widget
              //       const SizedBox(
              //           height:
              //               10), // Add some space between the image and the button
              //       IconButton(
              //         icon: const Icon(Icons.edit,
              //             color: Colors.white), // Edit icon
              //         onPressed: () {
              //           // Handle the edit button press here
              //           print('Edit button pressed');
              //         },
              //       ),
              //     ],
              //   ),
              // ),
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _profileImage(c.currentUser.value!),
                    const SizedBox(height: 15),
                    Text(c.currentUser.value!.memberName!.split(' ').first,
                        style: const TextStyle(
                          color: Colors.white,
                          // fontSize: 16, // Adjust the font size as needed
                        )),
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
                          Icon(Icons.edit, color: Colors.white), // Edit icon
                          SizedBox(width: 5),
                          Text(
                            'Edit',
                            style: TextStyle(
                              color: Colors.white,
                              // fontSize: 16, // Adjust the font size as needed
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                onTap: () {
                  Get.to(() => EditProfilePage(user: c.currentUser.value!));
                },
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Welcome ${c.currentUser.value?.memberName?.split(' ').first}",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 20),
                const Center(child: NfcGeneratorAnimation()),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create a customized exercise plan",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Create a customized exercise plan that aligns with your preferences, which you can modify at any time and adjust based on your feedback.",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16.0),
                      CustomElevatedButton(
                        title: "Generate",
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
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Discover the ideal calorie intake",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Discover the ideal calorie intake that matches your body's needs.",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16.0),
                      CustomElevatedButton(
                        title: "Calculate",
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
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Get Motivated",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Feeling unmotivated? Boost your spirits with our \"Get Motivated\" section.",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16.0),
                      CustomElevatedButton(
                        title: "Get Motivated",
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
      // backgroundImage: user.memberImageUrl != null
      //     ? NetworkImage(user.memberImageUrl!)
      //     :  AssetImage('assets/images/default_profile_image.png')
      //         as ImageProvider,
      child: ClipOval(
        child: user.memberImageUrl != null
            ? Image.network(
                "${Apis.imageUrl}/${user.memberImageUrl!}",
                width: 100, // Set the width of the image
                height: 100, // Set the height of the image
                fit: BoxFit
                    .cover, // Use BoxFit.cover to ensure the image covers the area without distortion
              )
            : Image.asset(
                'assets/images/default_profile_image.png',
                width: 100, // Set the width of the image
                height: 100, // Set the height of the image
                fit: BoxFit
                    .cover, // Use BoxFit.cover to ensure the image covers the area without distortion
              ),
      ),
    );
  }
}
