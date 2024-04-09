import 'package:fyp/model/memberships.dart';
import 'package:fyp/repo/get_memberships.dart';
import 'package:fyp/utils/custom_snackbar.dart';
import 'package:get/get.dart';

class PaymentsController extends GetxController {
  // Observable list to hold the gyms data
  var paymentsList = <Payments>[].obs;

  // Instance of GetGymsRepo
  final GetMEmbershipsRepo getMembershipssRepo = GetMEmbershipsRepo();

  // Method to fetch gyms data
  void fetchGyms(int? memberId) async {
    await getMembershipssRepo.getMemberships(
      memberId: memberId,
      onSuccess: (memberships) {
        paymentsList.value = memberships;
        memberships.sort((a, b) => b.isValid!.compareTo(a.isValid!));
        CustomSnackBar.success(
            title: "Memberships", message: "Memberships Fetched Successfully");
      },
      onError: (error) {
        // Handle error
        CustomSnackBar.error(
            title: "Memberships", message: "Failed to Fetch Memberships");
      },
    );
  }
}
