// import 'dart:io';
class Apis {
  static const ip = "172.16.18.1";
  // static const ip = "http://localhost";
  static const baseUrl = "http://$ip/fyp_backend";
  // static const baseUrl = "http://localhost/fyp_backend";
  // static const baseUrl = "http://172.16.16.1/fyp_backend";
  static const registerUrl = "$baseUrl/member/addMember.php";
  static const loginUrl = "$baseUrl/apis/login.php";
  static const updateMemberDetail = "$baseUrl/member/updateMember.php";
  static const getMemberDetail = "$baseUrl/member/getMember.php";
  static const paymentDetail = "$baseUrl/payment/registerPayment.php";
  static const getGymsUrl = "$baseUrl/Gym/FetchAllGym.php";
}

const String E_CLIENT_ID =
    "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R";
const String E_SECRET_KEY = "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==";
