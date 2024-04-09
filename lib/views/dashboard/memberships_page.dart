import 'package:flutter/material.dart';
import 'package:fyp/controller/dashboard/memberships_controller.dart';
import 'package:fyp/model/memberships.dart';
import 'package:fyp/utils/storage_keys.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PaymentsListView extends StatelessWidget {
  // final int? memberId;
  const PaymentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentsController = Get.put(PaymentsController());
    final a = StorageHelper();
    int? memberId = a.getUserId();
    paymentsController.fetchGyms(memberId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Previous Memberships'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: paymentsController.paymentsList.length,
          itemBuilder: (context, index) {
            final payment = paymentsController.paymentsList[index];
            return PaymentCard(payment: payment);
          },
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  final Payments payment;

  const PaymentCard({super.key, required this.payment});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(
                //   'user: ${StorageHelper().getUserId()}',
                //   style: const TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 16,
                //   ),
                // ),
                Text(
                  'Payment ID: ${payment.paymentId}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                _buildValidityIndicator(payment.isValid ?? 0),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Paid on: ${DateFormat('MMM dd, yyyy').format(payment.paymentDate ?? DateTime.now())}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today, color: Colors.grey),
                const SizedBox(width: 8),
                // Text(
                //   'Valid until: ${DateFormat('MMM dd, yyyy').format(payment.tillwhen)}',
                //   style: const TextStyle(
                //     fontSize: 14,
                //     color: Colors.grey,
                //   ),
                // ),
                Text(
                  'Valid until: ${DateFormat('MMM dd, yyyy').format(payment.tillwhen ?? DateTime.now())}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_month, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  'Duration: ${payment.months} month(s)',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildValidityIndicator(int isValid) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isValid == 1 ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        isValid == 1 ? 'Valid' : 'Expired',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
