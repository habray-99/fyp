// import 'package:flutter/material.dart';
// import 'package:fyp/controller/dashboard/gym_detail_controller.dart';
// import 'package:fyp/views/dashboard/payments_option_page.dart';
// import 'package:fyp/widgets/custom/custom_elevated_button.dart';
// // import 'package:fyp/model/gyms.dart'; // Make sure to import your Gyms model
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';

// import '../../controller/dashboard/home_controller.dart';
// import '../../model/gym_detail.dart';

// class GymDetailPage extends StatelessWidget {
//   final Gyms gym;

// //   DateTime _selectedDate = DateTime.now();
// //  int _months = 1;

//   GymDetailPage({super.key, required this.gym});

//   final c = Get.put(HomeScreenController());
//   final controller = Get.put(GymDetailPageController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(gym.gymName ?? 'Gym Details'),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Hero(
//                 tag: 'gym-${gym.gymId}', // Use gymId for the Hero tag
//                 child: Text(
//                   gym.gymName ?? 'Unknown Gym',
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 ),
//               ),
//               Text('Address: ${gym.gymAddress ?? 'Address not available'}'),
//               Text('Phone: ${gym.gymPhone ?? 'Phone not available'}'),
//               Text('Email: ${gym.gymEmail ?? 'Email not available'}'),
//               Text("Price: ${gym.gymPrice ?? 'Price not available'}"),
//               // Assuming gymPhotos is a comma-separated string of URLs
//               Text('Photos: ${gym.gymPhotos ?? 'No photos available'}'),
//               // Text("Start from : $DateTime.now()"),
//               // const Text("Months : 2"),
//               Obx(
//                 () => Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         decoration: const InputDecoration(
//                           labelText: 'Select Date',
//                         ),
//                         controller: TextEditingController(
//                             text: DateFormat('yyyy-MM-dd')
//                                 .format(controller.selectedDate.value)),
//                         readOnly: true,
//                         onTap: () async {
//                           final DateTime? picked = await showDatePicker(
//                             context: context,
//                             initialDate: controller.selectedDate.value,
//                             firstDate: DateTime(2000),
//                             lastDate: DateTime(2100),
//                           );
//                           if (picked != null &&
//                               picked != controller.selectedDate.value) {
//                             controller.selectedDate.value = picked;
//                           }
//                         },
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         controller.selectedDate.value = DateTime.now();
//                       },
//                       child: const Text('Today'),
//                     ),
//                   ],
//                 ),
//               ),
//               Obx(
//                 () => TextFormField(
//                   decoration: const InputDecoration(
//                     labelText: 'Months',
//                   ),
//                   keyboardType: TextInputType.number,
//                   initialValue: controller.months.value.toString(),
//                   onChanged: (value) {
//                     controller.months.value = int.tryParse(value) ?? 1;
//                   },
//                 ),
//               ),
//               Obx(() => Text(
//                     'Total Price: Rs. ${controller.calculateTotalPrice(gym.gymPrice ?? 0, controller.months.value)}',
//                     style: const TextStyle(fontSize: 20),
//                   )),
//               const Spacer(),
//               CustomElevatedButton(
//                 onTap: () {
//                   int totalCost = controller.calculateTotalPrice(
//                       gym.gymPrice ?? 0, controller.months.value);
//                   Get.to(() => PaymentPage(gym: gym, totalCost: totalCost));
//                 },
//                 title: 'Proceed to Payment',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fyp/controller/dashboard/gym_detail_controller.dart';
import 'package:fyp/views/dashboard/payments_option_page.dart';
import 'package:fyp/widgets/custom/custom_elevated_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/dashboard/home_controller.dart';
import '../../model/gym_detail.dart';

class GymDetailPage extends StatelessWidget {
  final Gyms gym;

  GymDetailPage({super.key, required this.gym});

  final c = Get.put(HomeScreenController());
  final controller = Get.put(GymDetailPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gym.gymName ?? 'Gym Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: 'gym-${gym.gymId}',
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      gym.gymName ?? 'Unknown Gym',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Address: ${gym.gymAddress ?? 'Address not available'}'),
                      const SizedBox(height: 8.0),
                      Text('Phone: ${gym.gymPhone ?? 'Phone not available'}'),
                      const SizedBox(height: 8.0),
                      Text('Email: ${gym.gymEmail ?? 'Email not available'}'),
                      const SizedBox(height: 8.0),
                      Text('Price: ${gym.gymPrice ?? 'Price not available'}'),
                      const SizedBox(height: 8.0),
                      Text('Photos: ${gym.gymPhotos ?? 'No photos available'}'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Select Date',
                          prefixIcon: Icon(Icons.calendar_today),
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
                    const SizedBox(width: 16.0),
                    TextButton(
                      onPressed: () {
                        controller.selectedDate.value = DateTime.now();
                      },
                      child: const Text('Today'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Obx(
                () => TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Months',
                    prefixIcon: Icon(Icons.calendar_month),
                  ),
                  keyboardType: TextInputType.number,
                  initialValue: controller.months.value.toString(),
                  onChanged: (value) {
                    controller.months.value = int.tryParse(value) ?? 1;
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              Obx(() => Text(
                    'Total Price: Rs. ${controller.calculateTotalPrice(gym.gymPrice ?? 0, controller.months.value)}',
                    style: Theme.of(context).textTheme.titleLarge,
                  )),
              const SizedBox(height: 24.0),
              CustomElevatedButton(
                onTap: () {
                  int totalCost = controller.calculateTotalPrice(
                      gym.gymPrice ?? 0, controller.months.value);
                  Get.to(() => PaymentPage(gym: gym, totalCost: totalCost));
                },
                title: 'Proceed to Payment',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
