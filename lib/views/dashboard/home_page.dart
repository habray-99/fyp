import 'package:flutter/material.dart';
import 'package:fyp/controller/core_controller.dart';
import 'package:fyp/views/dashboard/all_gyms_list.dart';
import 'package:fyp/views/dashboard/quote_list_page.dart';
import 'package:fyp/widgets/custom/custom_elevated_button.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  var c = Get.put(CoreController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
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
                  Get.to(() => GymListPage());
                },
              ),
              ListTile(
                title: const Text('Calories Calculator'),
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
        body: Column(
          children: [
            ListTile(
              title: Text(
                  "Welcome ${c.currentUser.value?.memberName?.split(' ').first}"),
              // subtitle: Text(
              // "You are logged in as ${c.currentUser.value?.memberName}"),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
