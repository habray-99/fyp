import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fyp/repo/get_gyms.dart';
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
  List<Gyms> filteredGyms = [];
  TextEditingController searchController = TextEditingController();
  bool isSortedAscending = true;
  String sortCriteria = 'price';

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
          log('Error fetching gyms: $error');
        },
      );
    } catch (e) {
      log('Exception: $e');
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

  // void sortGyms() {
  //   setState(() {
  //     filteredGyms.sort((a, b) {
  //       if (isSortedAscending) {
  //         return (a.gymPrice ?? 0).compareTo(b.gymPrice ?? 0);
  //       } else {
  //         return (b.gymPrice ?? 0).compareTo(a.gymPrice ?? 0);
  //       }
  //     });
  //   });
  // }
  void sortGyms(String criteria) {
    setState(() {
      filteredGyms.sort((a, b) {
        if (isSortedAscending) {
          return _compare(a, b, criteria);
        } else {
          return _compare(b, a, criteria);
        }
      });
    });
  }

  int _compare(Gyms a, Gyms b, String criteria) {
    switch (criteria) {
      case 'price':
        return (a.gymPrice ?? 0).compareTo(b.gymPrice ?? 0);
      case 'name':
        return a.gymName?.compareTo(b.gymName ?? '') ?? 0;
      default:
        return 0;
    }
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
          // Row(
          //   children: [
          //     IconButton(
          //       icon: const Icon(Icons.sort),
          //       onPressed: () {
          //         sortGyms();
          //         setState(() {
          //           isSortedAscending = !isSortedAscending;
          //         });
          //       },
          //     ),
          //     Text(isSortedAscending
          //         ? 'Sort by Price (Ascending)'
          //         : 'Sort by Price (Descending)'),
          //   ],
          // ),

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: sortCriteria,
                  icon: const Icon(Icons.arrow_drop_down_rounded,
                      color: Colors.deepPurple),
                  iconSize: 24,
                  elevation: 4,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 1,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      sortCriteria = newValue ?? 'price';
                      sortGyms(sortCriteria);
                    });
                  },
                  items: ['price', 'name']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value.capitalize!),
                    );
                  }).toList(),
                ),
                Row(
                  children: [
                    Text(
                      'Sort by $sortCriteria ${isSortedAscending ? '(Ascending)' : '(Descending)'}',
                      style: const TextStyle(color: Colors.deepPurple),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.sort_rounded,
                          color: Colors.deepPurple),
                      onPressed: () {
                        setState(() {
                          isSortedAscending = !isSortedAscending;
                        });
                        sortGyms(sortCriteria);
                      },
                    ),
                  ],
                ),
              ],
            ),
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
                                    // "https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                    gym.gymPhotos ?? '',
                                        // 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
