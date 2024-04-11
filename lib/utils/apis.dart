// import 'dart:io';
class Apis {
  static const ip = "10.0.2.2";
  // static const ip = "192.168.1.4";
  static const baseUrl = "http://$ip/fyp_backend";
  // static const baseUrl = "http://localhost/fyp_backend";
  // static const baseUrl = "http://172.16.16.1/fyp_backend";
  static const registerUrl = "$baseUrl/member/addMember.php";
  static const updateUrl = "$baseUrl/member/updateMember.php";
  static const loginUrl = "$baseUrl/apis/login.php";
  static const imageUrl = "$baseUrl/assets/";
  static const updateMemberDetail = "$baseUrl/member/updateMember.php";
  static const getMemberDetail = "$baseUrl/member/getMember.php";
  static const paymentDetail = "$baseUrl/payment/PaymentDone.php";
  static const getGymsUrl = "$baseUrl/Gym/FetchAllGym.php";
  static const addBooking = "$baseUrl/payment/registerPayment.php";
  static const GETQOUTES = "$baseUrl/Motivation/MotivationPaginated.php";
  static const GETPREVIOUSMEMBERSHIPS =
      "$baseUrl/payment/FetchAllPaymentOfMember.php";

  // static const getRecommendations = "http://10.0.2.2/myapp/random-exercises/";
  static const getRecommendations = "http://$ip:8000/myapp/random-exercises/";
  // "http://127.0.0.1:8000/myapp/random-exercises";

  static String get E_CLIENT_ID =>
      "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R";
  static String get E_SECRET_KEY => "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==";
}
