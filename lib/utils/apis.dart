class Apis {
  static const baseUrl = "http://172.16.18.31/fyp_backend";
  // static const baseUrl = "http://192.168.1.2/fyp_backend";
  static const registerUrl = "$baseUrl/member/addMember.php";
  static const loginUrl = "$baseUrl/apis/login.php";
  static const updateMemberDetail = "$baseUrl/member/updateMember.php";
  static const getMemberDetail = "$baseUrl/member/getMember.php";
  static const paymentDetail = "$baseUrl/payment/registerPayment.php";
}
