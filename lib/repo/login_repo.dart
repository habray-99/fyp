import 'dart:convert';
import 'dart:developer';

// import 'package:file_structure/models/user_details.dart';
// import 'package:file_structure/utils/apis.dart';
import 'package:fyp/model/user_detail.dart';
import 'package:fyp/utils/apis.dart';
import 'package:http/http.dart' as http;

class LoginRepo {
  static Future<void> login({
    required String email,
    required String password,
    required Function(Users user, String? token) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var header = {
        "Accept": "application/json",
      };

      var body = {
        'email': email,
        'password': password,
      };

      print(body);
      var url = Uri.http('172.16.18.31', 'fyp_backend/apis/login.php');
      // "type": "customer",
      // var response = await http.post(
      //   // Uri.parse(Apis.loginUrl),

      //   ,
      //   headers: header,
      //   body: body,
      // );
      print(url);
      var response = await http.post(url, body: body);

      dynamic data = jsonDecode(response.body);
      print(data);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // String token = data["token"].toString();
        Users user = Users.fromJson(data["user"]);
        String? token = user.memberToken?.toString();
        onSuccess(user, token);
      } else {
        onError(data["message"].toString());
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      // String m = $'';
      String m1 = e.toString();
      String m2 = s.toString();
      onError("Something went wrong \n$m1\n $m2");
    }
  }
}
