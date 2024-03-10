import 'dart:convert';
import 'dart:developer';

import 'package:fyp/utils/apis.dart';
import 'package:http/http.dart' as http;

import '../model/user_detail.dart';

class RegisterRepo {
  static Future<void> register({
    required String memberName,
    required String memberEmail,
    required String memberPhone,
    required String memberAddress,
    required String memberPassword,
    String? memberHeight,
    String? memberWeight,
    String? memberType,
    required Function(Users users, String token) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var header = {
        "Accept": "application/json",
      };
      var body = {
        "member_name": memberName,
        "member_email": memberEmail,
        "member_phone": memberPhone,
        "member_password": memberPassword,
        "member_address": memberAddress,
        "member_height": memberHeight,
        "member_weight": memberWeight,
        "member_type": memberType,
      };
      http.Response response = await http.post(
        Uri.parse(Apis.registerUrl),
        // headers: header,
        body: body,
      );
      log(body.toString());
      log(Apis.registerUrl);
      dynamic data = jsonDecode(response.body.toString());
      // log(data.toString());
      // if (response.statusCode >= 200 && response.statusCode <= 300) {
      if (response.statusCode == 200) {
        log(data.toString());
        Users user = Users.fromJson(data["member"]);
        String token = user.memberToken.toString();
        // onSuccess(data["message"]);
        onSuccess(user, token);
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Something went wrong");
    }
  }
}
