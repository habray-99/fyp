// ignore_for_file: constant_identifier_names

import 'dart:developer';

// import 'package:file_structure/models/user_details.dart';
import 'package:get_storage/get_storage.dart';


class StorageKeys {
  static const String USER = "user";
  static const String ACCESS_TOKEN = "accessToken";
}

class StorageHelper {
    static getToken() {
    try {
      final box = GetStorage();
      String token = box.read(StorageKeys.ACCESS_TOKEN);
      return token;
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      return null;
    }
  }
  
  // static UserDetail? getUser() {
  //   log("Fetching user");
  //   try {
  //     final box = GetStorage();
  //     log("${box.read(StorageKeys.USER)}");
  //     UserDetail user = UserDetail.fromJson(json.decode(box.read(StorageKeys.USER)));
  //     return user;
  //   } catch (e, s) {
  //     log(e.toString());
  //     log(s.toString());
  //     return null;
  //   }
  // }
}