class Apis {
  static const baseUrl = "http://192.168.1.77/kenny/api";
  // static const baseUrl = "http://192.168.1.73/kenny/api";
  // static const getHistory = "$baseUrl/get_appointments.php/";
  static const getHistory =
      "$baseUrl/get_appointments.php?token=02f1711b311e3810e8c367a3a7f24b93";
  static const getDoctors = "$baseUrl/doctors.php";
  static const loginUrl = "$baseUrl/login.php";
  static const registerUrl = "$baseUrl/register_user.php";

  static const String addBooking = "$baseUrl/store_appointments.php";
}
