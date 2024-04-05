import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:fyp/utils/apis.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';

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
    File? memberImageUrl,
  }) async {
    try {
      var uri = Uri.parse(Apis.registerUrl);
      var request = http.MultipartRequest('POST', uri);
      request.fields['member_name'] = memberName;
      request.fields['member_email'] = memberEmail;
      request.fields['member_phone'] = memberPhone;
      request.fields['member_password'] = memberPassword;
      request.fields['member_address'] = memberAddress;
      request.fields['member_height'] = memberHeight ?? '';
      request.fields['member_weight'] = memberWeight ?? '';
      request.fields['member_type'] = memberType ?? "1";
      if (memberImageUrl != null) {
        var imageFile = await http.MultipartFile.fromPath(
          'member_image',
          memberImageUrl as String,
          contentType:
              MediaType('image', path.extension(memberImageUrl as String).substring(1)),
        );
        request.files.add(imageFile);
      }

      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await http.Response.fromStream(response);
        dynamic data = jsonDecode(responseData.body.toString());

        log(data.toString());
        Users user = Users.fromJson(data["member"]);
        String token = user.memberToken.toString();
        onSuccess(user, token);
      } else {
        onError('Registration failed');
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Something went wrong");
    }
  }

  static Future<void> updateDetail({
    required String memberName,
    required String memberEmail,
    required String memberPhone,
    required String memberAddress,
    String? memberPassword,
    String? memberHeight,
    String? memberWeight,
    String? memberType,
    required Function(Users users, String token) onSuccess,
    required Function(String message) onError,
    String? memberImageUrl,
    required String memberId,
  }) async {
    try {
      var uri = Uri.parse(Apis.updateMemberDetail);
      var request = http.MultipartRequest('POST', uri);

      // Add user detail fields
      request.fields['member_name'] = memberName;
      request.fields['member_email'] = memberEmail;
      request.fields['member_phone'] = memberPhone;
      request.fields['member_id'] = memberId;
      // request.fields['member_password'] = memberPassword;
      request.fields['member_address'] = memberAddress;
      request.fields['member_height'] = memberHeight ?? '';
      request.fields['member_weight'] = memberWeight ?? '';
      request.fields['member_type'] = memberType ?? '';

      log("image is : ${memberImageUrl.toString()}");

      // Add image file if available
      if (memberImageUrl != null) {
        var imageFile = await http.MultipartFile.fromPath(
          'member_image',
          memberImageUrl,
          contentType:
              MediaType('image', path.extension(memberImageUrl).substring(1)),
        );
        request.files.add(imageFile);
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await http.Response.fromStream(response);
        dynamic data = jsonDecode(responseData.body.toString());

        log(data.toString());
        Users user = Users.fromJson(data["member"]);
        String token = user.memberToken.toString();
        onSuccess(user, token);
      } else {
        onError('Update detail failed');
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Something went wrong");
    }
  }
}
