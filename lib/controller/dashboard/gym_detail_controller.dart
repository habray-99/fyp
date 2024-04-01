import 'package:get/get.dart';

class GymDetailPageController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxInt months = 1.obs;
  RxInt totalPrice = 0.obs;
// Pass totalPrice, controller.selectedDate.value, and controller.months.value to your register function
  int calculateTotalPrice(int gymPrice, int months) {
    return gymPrice * months;
  }
}
