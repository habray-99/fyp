import 'package:get/get.dart';


class HomeScreenController extends GetxController {
  RxBool loading = RxBool(false);
  // registerPayment(
  //     String gymId, DateTime date, int months, int totalCost) async {
  //   loading.value = true;
  //   await BookingRepo.addBooking(
  //       gymID: gymId,
  //       date: date.toString(),
  //       month: months.toString(),
  //       amount: totalCost.toString(),
  //       onSuccess: () {
  //         loading.value = false;
  //         Get.offAllNamed("/home");
  //         CustomSnackBar.success(
  //             title: "Booking", message: "Booking has been successfully done");
  //       },
  //       onError: (message) {
  //         loading.value = false;
  //         CustomSnackBar.error(title: "Booking", message: message);
  //       });
  // }
}
