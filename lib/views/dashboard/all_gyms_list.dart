// import 'package:flutter/material.dart';
// import 'package:fyp/repo/get_gyms.dart';
// // import 'package:fyp/model/gyms.dart'; // Make sure to import your Gyms model
// import 'package:fyp/views/dashboard/gym_detail_page.dart';
// import 'package:get/get.dart';

// import '../../model/gym_detail.dart';

// class GymListPage extends StatefulWidget {
//   const GymListPage({super.key});

//   @override
//   _GymListPageState createState() => _GymListPageState();
// }

// class _GymListPageState extends State<GymListPage> {
//   final GetGymsRepo getGymsRepo = GetGymsRepo();
//   List<Gyms> gyms = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchGyms();
//   }

//   void fetchGyms() async {
//     try {
//       await getGymsRepo.getGyms(
//         onSuccess: (gymsList) {
//           setState(() {
//             gyms = gymsList;
//           });
//         },
//         onError: (error) {
//           // Handle error, e.g., show a SnackBar or a dialog
//           print('Error fetching gyms: $error');
//         },
//       );
//     } catch (e) {
//       // Handle any other exceptions
//       print('Exception: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Gyms'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView.builder(
//           itemCount: gyms.length,
//           itemBuilder: (context, index) {
//             final gym = gyms[index];
//             return Padding(
//               padding: const EdgeInsets.only(top: 8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   // border: Border(
//                   //   bottom: BorderSide(
//                   //     color: Theme.of(context).dividerColor,
//                   //   ),
//                   // ),
//                   color: Theme.of(context).cardColor.withOpacity(0.6),
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 1,
//                       blurRadius: 2,
//                       offset: const Offset(0, 3), // changes position of shadow
//                     ),
//                   ],
//                 ),
//                 child: ListTile(
//                   title: Hero(
//                     tag: 'gym-$index',
//                     child: Text(
//                       gym.gymName ?? 'Unknown Gym',
//                       style: Theme.of(context).textTheme.headlineMedium,
//                     ), //style: TextStyle(fontSize: 18)),
//                   ),
//                   subtitle: Text(gym.gymAddress ?? 'Address not available'),
//                   onTap: () => Get.to(() => GymDetailPage(gym: gym)),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:fyp/repo/get_gyms.dart';
// import 'package:fyp/views/dashboard/gym_detail_page.dart';
// import 'package:get/get.dart';

// import '../../model/gym_detail.dart';

// class GymListPage extends StatefulWidget {
//   const GymListPage({super.key});

//   @override
//   _GymListPageState createState() => _GymListPageState();
// }

// class _GymListPageState extends State<GymListPage> {
//   final GetGymsRepo getGymsRepo = GetGymsRepo();
//   List<Gyms> gyms = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchGyms();
//   }

//   void fetchGyms() async {
//     try {
//       await getGymsRepo.getGyms(
//         onSuccess: (gymsList) {
//           setState(() {
//             gyms = gymsList;
//           });
//         },
//         onError: (error) {
//           print('Error fetching gyms: $error');
//         },
//       );
//     } catch (e) {
//       print('Exception: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Gyms'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView.separated(
//           itemCount: gyms.length,
//           separatorBuilder: (context, index) => const SizedBox(height: 8.0),
//           itemBuilder: (context, index) {
//             final gym = gyms[index];
//             return Card(
//               elevation: 4.0,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: ListTile(
//                 title: Hero(
//                   tag: 'gym-${gym.gymId}',
//                   child: Text(
//                     gym.gymName ?? 'Unknown Gym',
//                     style: Theme.of(context).textTheme.headlineMedium,
//                   ),
//                 ),
//                 subtitle: Text(gym.gymAddress ?? 'Address not available'),
//                 onTap: () => Get.to(() => GymDetailPage(gym: gym)),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:fyp/repo/get_gyms.dart';
import 'package:fyp/views/dashboard/gym_detail_page.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../model/gym_detail.dart';

class GymListPage extends StatefulWidget {
  const GymListPage({super.key});

  @override
  _GymListPageState createState() => _GymListPageState();
}

class _GymListPageState extends State<GymListPage> {
  final GetGymsRepo getGymsRepo = GetGymsRepo();
  List<Gyms> gyms = [];
  List<Gyms> filteredGyms = [];
  TextEditingController searchController = TextEditingController();
  bool isSortedAscending = true;

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
            filteredGyms = gymsList;
          });
        },
        onError: (error) {
          print('Error fetching gyms: $error');
        },
      );
    } catch (e) {
      print('Exception: $e');
    }
  }

  void filterGyms(String query) {
    setState(() {
      filteredGyms = gyms
          .where((gym) =>
              (gym.gymName?.toLowerCase().contains(query.toLowerCase()) ??
                  false) ||
              (gym.gymAddress?.toLowerCase().contains(query.toLowerCase()) ??
                  false))
          .toList();
    });
  }

  void sortGyms() {
    setState(() {
      filteredGyms.sort((a, b) {
        if (isSortedAscending) {
          return (a.gymPrice ?? 0).compareTo(b.gymPrice ?? 0);
        } else {
          return (b.gymPrice ?? 0).compareTo(a.gymPrice ?? 0);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gyms'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search gyms',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                filterGyms(value);
              },
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.sort),
                onPressed: () {
                  sortGyms();
                  setState(() {
                    isSortedAscending = !isSortedAscending;
                  });
                },
              ),
              Text(isSortedAscending
                  ? 'Sort by Price (Ascending)'
                  : 'Sort by Price (Descending)'),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: filteredGyms.length,
                itemBuilder: (context, index) {
                  final gym = filteredGyms[index];
                  return InkWell(
                    onTap: () => Get.to(() => GymDetailPage(gym: gym)),
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Hero(
                              tag: 'gym-${gym.gymId}-image',
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: 'gym-${gym.gymId}-name',
                                  child: Text(
                                    gym.gymName ?? 'Unknown Gym',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  gym.gymAddress ?? 'Address not available',
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'Price: Rs.${gym.gymPrice ?? 0}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// class GymListPage extends StatefulWidget {
//   const GymListPage({super.key});

//   @override
//   _GymListPageState createState() => _GymListPageState();
// }

// class _GymListPageState extends State<GymListPage> {
//   final GetGymsRepo getGymsRepo = GetGymsRepo();
//   List<Gyms> gyms = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchGyms();
//   }

//   void fetchGyms() async {
//     try {
//       await getGymsRepo.getGyms(
//         onSuccess: (gymsList) {
//           setState(() {
//             gyms = gymsList;
//           });
//         },
//         onError: (error) {
//           print('Error fetching gyms: $error');
//         },
//       );
//     } catch (e) {
//       print('Exception: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Gyms'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 0.8,
//             crossAxisSpacing: 8.0,
//             mainAxisSpacing: 8.0,
//           ),
//           itemCount: gyms.length,
//           itemBuilder: (context, index) {
//             final gym = gyms[index];
//             return InkWell(
//               onTap: () => Get.to(() => GymDetailPage(gym: gym)),
//               child: Card(
//                 elevation: 4.0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Hero(
//                         tag: 'gym-${gym.gymId}-image',
//                         child: CachedNetworkImage(
//                           imageUrl:
//                               "https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//                           placeholder: (context, url) =>
//                               const CircularProgressIndicator(),
//                           errorWidget: (context, url, error) =>
//                               const Icon(Icons.error),
//                           fit: BoxFit.scaleDown,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Hero(
//                             tag: 'gym-${gym.gymId}-name',
//                             child: Text(
//                               gym.gymName ?? 'Unknown Gym',
//                               style: Theme.of(context).textTheme.headlineMedium,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           Text(
//                             gym.gymAddress ?? 'Address not available',
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
