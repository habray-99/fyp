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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp/controller/dashboard/gym_detail_controller.dart';
import 'package:fyp/views/dashboard/payments_option_page.dart';
import 'package:fyp/widgets/custom/custom_elevated_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/dashboard/home_controller.dart';
import '../../model/gym_detail.dart';

// import '../../controller/dashboard/home_controller.dart';
// import '../../model/gym_detail.dart';

// class GymDetailPage extends StatelessWidget {
//   final Gyms gym;

//   GymDetailPage({super.key, required this.gym});

//   final c = Get.put(HomeScreenController());
//   final controller = Get.put(GymDetailPageController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(gym.gymName ?? 'Gym Details'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Hero(
//                 tag: 'gym-${gym.gymId}',
//                 child: Material(
//                   elevation: 4.0,
//                   borderRadius: BorderRadius.circular(8.0),
//                   child: Container(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text(
//                       gym.gymName ?? 'Unknown Gym',
//                       style: Theme.of(context).textTheme.headlineMedium,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               Card(
//                 elevation: 4.0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                           'Address: ${gym.gymAddress ?? 'Address not available'}'),
//                       const SizedBox(height: 8.0),
//                       Text('Phone: ${gym.gymPhone ?? 'Phone not available'}'),
//                       const SizedBox(height: 8.0),
//                       Text('Email: ${gym.gymEmail ?? 'Email not available'}'),
//                       const SizedBox(height: 8.0),
//                       Text('Price: ${gym.gymPrice ?? 'Price not available'}'),
//                       const SizedBox(height: 8.0),
//                       Text('Photos: ${gym.gymPhotos ?? 'No photos available'}'),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               Obx(
//                 () => Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         decoration: const InputDecoration(
//                           labelText: 'Select Date',
//                           prefixIcon: Icon(Icons.calendar_today),
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
//                     const SizedBox(width: 16.0),
//                     TextButton(
//                       onPressed: () {
//                         controller.selectedDate.value = DateTime.now();
//                       },
//                       child: const Text('Today'),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               Obx(
//                 () => TextFormField(
//                   decoration: const InputDecoration(
//                     labelText: 'Months',
//                     prefixIcon: Icon(Icons.calendar_month),
//                   ),
//                   keyboardType: TextInputType.number,
//                   initialValue: controller.months.value.toString(),
//                   onChanged: (value) {
//                     controller.months.value = int.tryParse(value) ?? 1;
//                   },
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               Obx(() => Text(
//                     'Total Price: Rs. ${controller.calculateTotalPrice(gym.gymPrice ?? 0, controller.months.value)}',
//                     style: Theme.of(context).textTheme.titleLarge,
//                   )),
//               const SizedBox(height: 24.0),
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
              // Image section
              Hero(
                tag: 'gym-${gym.gymId}-image',
                child: CachedNetworkImage(
                  imageUrl:
                      // "https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      gym.gymPhotos ?? '',
                  // 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  width: MediaQuery.of(context)
                      .size
                      .width, // Adjust the width as needed
                  height: Get.height * .4, // Adjust the height as needed
                  fit: BoxFit.scaleDown,
                ),
              ),
              const SizedBox(height: 16.0),
              // Address section
              SizedBox(
                width: double.infinity,
                child: Card(
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
                        // const SizedBox(height: 8.0),
                        // Text(
                        //     'Photos: ${gym.gymPhotos ?? 'No photos available'}'),
                      ],
                    ),
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
                  inputFormatters: [PositiveNumberFormatter()],
                  decoration: const InputDecoration(
                    labelText: 'Months',
                    prefixIcon: Icon(Icons.calendar_month),
                  ),
                  keyboardType: TextInputType.number,
                  initialValue: controller.months.value.toString(),
                  onChanged: (value) {
                    controller.months.value = int.tryParse(value) ?? 1;
                  },
                  validator: (value) {
                    if (int.tryParse(value ?? '') == null) {
                      return 'Please enter a valid number';
                    } else if (int.parse(value ?? '') <= 0) {
                      return 'Months must be positive';
                    }
                    return null;
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

class PositiveNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Regular expression to match any sequence of digits
    final RegExp regExp = RegExp(r'^\d+$');

    // Check if the new value matches the regular expression
    if (regExp.hasMatch(newValue.text)) {
      // If it matches, return the new value
      return newValue;
    } else {
      // If it doesn't match, return the old value
      return oldValue;
    }
  }
}
