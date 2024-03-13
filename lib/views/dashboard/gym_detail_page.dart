import 'package:flutter/material.dart';
// import 'package:fyp/model/gyms.dart'; // Make sure to import your Gyms model
import 'package:get/get.dart';

import '../../model/gym_detail.dart';

class GymDetailPage extends StatelessWidget {
 final Gyms gym;

 GymDetailPage({required this.gym});

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gym.gymName ?? 'Gym Details'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: 'gym-${gym.gymId}', // Use gymId for the Hero tag
                child: Text(
                 gym.gymName ?? 'Unknown Gym',
                 style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Text('Address: ${gym.gymAddress ?? 'Address not available'}'),
              Text('Phone: ${gym.gymPhone ?? 'Phone not available'}'),
              Text('Email: ${gym.gymEmail ?? 'Email not available'}'),
              // Assuming gymPhotos is a comma-separated string of URLs
              Text('Photos: ${gym.gymPhotos ?? 'No photos available'}'),
              // Add any additional details about the gym here
            ],
          ),
        ),
      ),
    );
 }
}
