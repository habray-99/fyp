import 'package:flutter/material.dart';
import 'package:fyp/controller/dashboard/gym_detail_controller.dart';
import 'package:fyp/views/dashboard/payments_option_page.dart';
import 'package:fyp/widgets/custom/custom_elevated_button.dart';
// import 'package:fyp/model/gyms.dart'; // Make sure to import your Gyms model
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/dashboard/home_controller.dart';
import '../../model/gym_detail.dart';

class GymDetailPage extends StatelessWidget {
  final Gyms gym;

//   DateTime _selectedDate = DateTime.now();
//  int _months = 1;

  GymDetailPage({super.key, required this.gym});

  final c = Get.put(HomeScreenController());
  final controller = Get.put(GymDetailPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gym.gymName ?? 'Gym Details'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: 'gym-${gym.gymId}', // Use gymId for the Hero tag
                child: Text(
                  gym.gymName ?? 'Unknown Gym',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Text('Address: ${gym.gymAddress ?? 'Address not available'}'),
              Text('Phone: ${gym.gymPhone ?? 'Phone not available'}'),
              Text('Email: ${gym.gymEmail ?? 'Email not available'}'),
              Text("Price: ${gym.gymPrice ?? 'Price not available'}"),
              // Assuming gymPhotos is a comma-separated string of URLs
              Text('Photos: ${gym.gymPhotos ?? 'No photos available'}'),
              // Text("Start from : $DateTime.now()"),
              // const Text("Months : 2"),
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Select Date',
                        ),
                        controller: TextEditingController(
                            text: DateFormat('yyyy-MM-dd')
                                .format(controller.selectedDate.value)),
                        readOnly: true,
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: controller.selectedDate.value,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (picked != null &&
                              picked != controller.selectedDate.value) {
                            controller.selectedDate.value = picked;
                          }
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.selectedDate.value = DateTime.now();
                      },
                      child: const Text('Today'),
                    ),
                  ],
                ),
              ),
              Obx(
                () => TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Months',
                  ),
                  keyboardType: TextInputType.number,
                  initialValue: controller.months.value.toString(),
                  onChanged: (value) {
                    controller.months.value = int.tryParse(value) ?? 1;
                  },
                ),
              ),
              Obx(() => Text(
                    'Total Price: Rs. ${controller.calculateTotalPrice(gym.gymPrice ?? 0, controller.months.value)}',
                    style: const TextStyle(fontSize: 20),
                  )),
              const Spacer(),
              CustomElevatedButton(
                onTap: () {
                  int totalCost = controller.calculateTotalPrice(
                      gym.gymPrice ?? 0, controller.months.value);
                  Get.to(() => PaymentPage(gym: gym, totalCost: totalCost));
                },
                title: 'Proceed to Payment',
              ),

              // CustomElevatedButton(
              //   title: "Esewa",
              //   onTap: () {
              //     int totalCost = controller.calculateTotalPrice(
              //         gym.gymPrice ?? 0, controller.months.value);
              //     Payments eSewa = Payments();
              //     eSewa.EsewaPayments(
              //       gym.gymId.toString(),
              //       gym.gymName.toString(),
              //       totalCost.toString(), // Pass the total cost
              //       onSuccess: () {
              //         Get.offAll(() => HomePage());
              //         CustomSnackBar.success(
              //           title: "Booking",
              //           message: "Booking is done successfully",
              //         );
              //       },
              //     );
              //   },
              // ),
              // CustomElevatedButton(
              //   title: "Khalti",
              //   onTap: () {
              //     int totalCost = controller.calculateTotalPrice(
              //         gym.gymPrice ?? 0, controller.months.value);
              //     Payments khalti = Payments();
              //     khalti.KhaltiPayments(
              //       context,
              //       gym.gymId.toString(),
              //       gym.gymName.toString(),
              //       totalCost, // Pass the total cost
              //       onSuccess: () {
              //         c.registerPayment(gym.gymId.toString(), DateTime.now(),
              //             controller.months.value, totalCost);
              //       },
              //     );
              //   },
              // )

              // CustomElevatedButton(
              //     title: "Esewa",
              //     onTap: () {
              //       Payments eSewa = Payments();
              //       eSewa.EsewaPayments(
              //           gym.gymId.toString(),
              //           gym.gymName.toString(),
              //           gym.gymPrice.toString(), onSuccess: () {
              //         Get.offAll(() => HomePage());
              //         CustomSnackBar.success(
              //             title: "Booking",
              //             message: "Booking is done successfully");
              //       });
              //     }),

              // Add any additional details about the gym here
            ],
          ),
        ),
      ),
    );
  }
}
