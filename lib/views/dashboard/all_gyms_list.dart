import 'package:flutter/material.dart';
import 'package:fyp/repo/get_gyms.dart';
// import 'package:fyp/model/gyms.dart'; // Make sure to import your Gyms model
import 'package:fyp/views/dashboard/gym_detail_page.dart';
import 'package:get/get.dart';

import '../../model/gym_detail.dart';

class GymListPage extends StatefulWidget {
  const GymListPage({super.key});

  @override
  _GymListPageState createState() => _GymListPageState();
}

class _GymListPageState extends State<GymListPage> {
  final GetGymsRepo getGymsRepo = GetGymsRepo();
  List<Gyms> gyms = [];

  @override
  void initState() {
    super.initState();
    fetchGyms();
  }

  void fetchGyms() async {
    try {
      await getGymsRepo.getGyms(
        onSuccess: (gymsList) {
          setState(() {
            gyms = gymsList;
          });
        },
        onError: (error) {
          // Handle error, e.g., show a SnackBar or a dialog
          print('Error fetching gyms: $error');
        },
      );
    } catch (e) {
      // Handle any other exceptions
      print('Exception: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gyms'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: gyms.length,
          itemBuilder: (context, index) {
            final gym = gyms[index];
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  // border: Border(
                  //   bottom: BorderSide(
                  //     color: Theme.of(context).dividerColor,
                  //   ),
                  // ),
                  color: Theme.of(context).cardColor.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ListTile(
                  title: Hero(
                    tag: 'gym-$index',
                    child: Text(
                      gym.gymName ?? 'Unknown Gym',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ), //style: TextStyle(fontSize: 18)),
                  ),
                  subtitle: Text(gym.gymAddress ?? 'Address not available'),
                  onTap: () => Get.to(() => GymDetailPage(gym: gym)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
