import 'dart:convert';
import 'dart:developer';

import 'package:fyp/utils/http_request.dart';

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
      var body = {
        "gymID": gymID,
        "token": token,
        "date": date,
        "months": month,
        "amount": amount,
        "status": "paid",
      };
      http.Response response = await HttpRequest.post(
          Uri.parse(Apis.addBooking),
          headers: headers,
          body: body);
      // log();
      log(json.encode(body));
      log(response.body);

      dynamic data = jsonDecode(response.body);
      if (data["success"] == true) {
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
