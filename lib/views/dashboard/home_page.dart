import 'package:flutter/material.dart';
import 'package:fyp/controller/core_controller.dart';
import 'package:fyp/views/dashboard/quote_list_page.dart';
import 'package:fyp/widgets/custom/custom_elevated_button.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  var c = Get.put(CoreController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      // body: Center(child: CustomElevatedButton(title: "Log Out", onTap: () {c.logOut();})),
      body: Column(
      // crossAxisAlignment: 
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
        children: [
          CustomElevatedButton(
            title: "Log Out",
            onTap: () {
              c.logOut();
            },
          ),
          CustomElevatedButton(
            title: "Quotes",
            onTap: () {
              Get.to(() => QuoteListPage());
            },
          ),
        ],
      ),
    );
  }
}
