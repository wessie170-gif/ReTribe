import 'package:flutter/material.dart';

class NeuronForgeScreen extends StatelessWidget {
  const NeuronForgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Neuron Forge')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '10-minute Daily Session\n\n',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
              Text(
                '• Active listening practice\n'
                '• Eye-contact drill (camera)\n'
                '• Loving-kindness exercise\n'
                '• Ends with real-life Action Bridge',
                style: TextStyle(fontSize: 18, height: 1.6),
              ),
              SizedBox(height: 40),
              Text(
                'This session rewires your brain for real connection.\n\nStart now and then go talk to a real person.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
