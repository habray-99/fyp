import 'package:flutter/material.dart';
import 'package:fyp/controller/dashboard/gym_detail_controller.dart';
import 'package:fyp/controller/payment_controller.dart';
import 'package:fyp/model/gym_detail.dart';
import 'package:fyp/repo/buying_membership_repo.dart';
import 'package:fyp/views/dashboard/home_page.dart';
import 'package:fyp/widgets/custom/custom_elevated_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../utils/custom_snackbar.dart';

class PaymentPage extends StatelessWidget {
  final Gyms gym;
  final int totalCost;
  final c = Get.put(GymDetailPageController());
  PaymentPage({super.key, required this.gym, required this.totalCost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Total Price: Rs. $totalCost',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            CustomElevatedButton(
              title: "eSewa",
              onTap: () {
                var newFormat = DateFormat("yyyy-MM-dd");
                String updatedDt = newFormat.format(c.selectedDate.value);
                Payments eSewa = Payments();
                eSewa.EsewaPayments(
                  gym.gymId.toString(),
                  gym.gymName.toString(),
                  totalCost.toString(),
                  onSuccess: () {
                    BookingRepo().addBooking(
                      gymID: gym.gymId.toString(),
                      date: updatedDt.toString(),
                      month: c.months.toString(),
                      onSuccess: () {
                        CustomSnackBar.success(
                          title: "Booking",
                          message: "Booking is done successfully",
                        );
                        Get.offAll(() => HomePage());
                      },
                      onError: (message) {
                        CustomSnackBar.error(
                          title: "Booking Error",
                          message: message,
                        );
                      },
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 16.0),
            CustomElevatedButton(
              title: "Khalti",
              onTap: () {
                Payments khalti = Payments();
                khalti.KhaltiPayments(
                  context,
                  gym.gymId.toString(),
                  gym.gymName.toString(),
                  totalCost * 100,
                  onSuccess: () {
                    var newFormat = DateFormat("yyyy-MM-dd");
                    String updatedDt = newFormat.format(c.selectedDate.value);
                    BookingRepo().addBooking(
                      gymID: gym.gymId.toString(),
                      date: updatedDt.toString(),
                      month: c.months.toString(),
                      amount: (totalCost * 100).toString(),
                      onSuccess: () {
                        CustomSnackBar.success(
                          title: "Booking",
                          message: "Booking is done successfully",
                        );
                        Get.offAll(() => HomePage());
                      },
                      onError: (message) {
                        CustomSnackBar.error(
                          title: "Booking Error",
                          message: message,
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
