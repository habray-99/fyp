import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:flutter/material.dart';
import 'package:fyp/utils/apis.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class Payments {
  EsewaPayments(String gymId, String gymName, String totalCost,
      {required Null Function() onSuccess}) {
    // print('Paying via eSewa');
    try {
      EsewaFlutterSdk.initPayment(
        esewaConfig: EsewaConfig(
          environment: Environment.test,
          clientId: Apis.E_CLIENT_ID,
          secretId: Apis.E_SECRET_KEY,
        ),
        esewaPayment: EsewaPayment(
          productId: gymId,
          productName: gymName,
          productPrice: totalCost, // Use totalCost here
        ),
        onPaymentSuccess: (EsewaPaymentSuccessResult data) {
          debugPrint(":::SUCCESS::: => $data");
          onSuccess();
        },
        onPaymentFailure: (data) {
          debugPrint(":::FAILURE::: => $data");
        },
        onPaymentCancellation: (data) {
          debugPrint(":::CANCELLATION::: => $data");
        },
      );
    } on Exception catch (e) {
      debugPrint("EXCEPTION : ${e.toString()}");
    }
  }

  KhaltiPayments(
      BuildContext context, String gymId, String gymName, int totalCost,
      {required Null Function() onSuccess}) {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
        amount: totalCost, // Use totalCost here
        productIdentity: gymId,
        productName: gymName,
      ),
      preferences: [
        PaymentPreference.khalti,
      ],
      onSuccess: (success) {
        debugPrint(":::SUCCESS::: => ");
        onSuccess();
      },
      onFailure: (fa) {
        debugPrint(":::FAILURE::: => ");
        // Handle failure, e.g., show a snackbar
      },
      onCancel: () {
        debugPrint(":::CANCELLATION::: => ");
        // Handle cancellation, e.g., show a snackbar
      },
    );
  }
}
