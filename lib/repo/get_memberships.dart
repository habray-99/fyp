import 'dart:convert';
import 'dart:developer';

import 'package:fyp/model/gym_detail.dart';
import 'package:fyp/model/memberships.dart';
import 'package:http/http.dart' as http;

import '../utils/apis.dart';

class GetMEmbershipsRepo {
  Future<void> getMemberships({
    required int? memberId,
    required Function(List<Payments> memberShips) onSuccess,
    required Function(String? error) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      var url = Uri.parse(Apis.GETPREVIOUSMEMBERSHIPS).replace(queryParameters: {
        'memberId': memberId.toString(),
      });

      var response = await http.get(
        url,
        headers: headers,
      );
      dynamic data = jsonDecode(response.body);
      if (data['message'] == "Payments fetched successfully") {
        var memberships = paymentsFromJson(data["payments"]);
        onSuccess(memberships);
      } else {
        onError(data['message']);
      }
    } catch (e) {
      log(e.toString());
      onError("Something went wrong");
    }
  }
}
