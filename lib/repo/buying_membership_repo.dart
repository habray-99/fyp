import 'dart:convert';
import 'dart:developer';

import '../utils/apis.dart';
import '../utils/storage_keys.dart';
import 'package:http/http.dart' as http;

class BookingRepo {
  Future<void> addBooking({
    required String gymID,
    required String date,
    required String month,
    required Function() onSuccess,
    required Function(String message) onError,
    String? amount,
  }) async {
    try {
      var token = StorageHelper.getToken();
      var headers = {
        "Accept": "application/json",
      };

      var userId = StorageHelper.getUser()?.memberId.toString();
      var body = {
        "gymID": gymID,
        "token": token,
        "userID": userId,
        "date": date,
        "months": month,
        // "amount": amount,
        "status": "paid",
      };
      var response = await http.post(Uri.parse(Apis.paymentDetail),
          headers: headers, body: body);
      log(response.body); // Logs the response body
      log(response.statusCode.toString()); // Logs the status code

      log(response as String);
      log(json.encode(body));
      log(response.body);

      dynamic data = jsonDecode(response.body);
      if (data["status"] == "success") {
        onSuccess();
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry something went wrong");
    }
  }
}
