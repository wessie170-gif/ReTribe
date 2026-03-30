import 'package:flutter/material.dart';

class TribeNetworkScreen extends StatelessWidget {
  const TribeNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tribe Network')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'Local in-person pods & storytelling circles coming soon.\n\n'
            'For now: Organize or join a real meetup with friends/family.\n'
            'No phones allowed during the circle.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
