import 'dart:convert';
import 'dart:developer';

import 'package:fyp/model/gym_detail.dart';
import 'package:http/http.dart' as http;

import '../utils/apis.dart';

class GetGymsRepo {
  Future<void> getGyms({
    required Function(List<Gyms> doctors) onSuccess,
    required Function(String? error) onError,
  }) async {
    try {


      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      http.Response response = await http.get(
        Uri.parse(Apis.getGymsUrl),
        headers: headers,
      );

      dynamic data = json.decode(response.body);
      log(data.toString());
      if (response.statusCode == 200 && response.statusCode < 300) {
        List<Gyms> gyms = gymDetailListFromJson(data["gyms"]);
        onSuccess(gyms);
      } else {
        onError(data['message']);
      }
    } catch (e) {
      log(e.toString());
      onError("Something went wrong");
    }
  }
}
