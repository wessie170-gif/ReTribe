import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/retribe_provider.dart';
import 'neuron_forge_screen.dart';
import 'irl_quests_screen.dart';
import 'tribe_network_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ReTribeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('ReTribe — Reclaim Humanity')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Your Synapse Garden: ${provider.gardenLevel}% 🌱',
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            if (provider.screenTimeWarning)
              const Text(
                'High screen time detected.\nTake a real-world break ❤️',
                style: TextStyle(color: Colors.orange, fontSize: 16),
              ),
            const SizedBox(height: 30),
            _buildButton(context, 'Daily Neuron Forge (10 min)', const NeuronForgeScreen()),
            const SizedBox(height: 12),
            _buildButton(context, 'IRL Quests — Step Into Life', const IRLQuestsScreen()),
            const SizedBox(height: 12),
            _buildButton(context, 'Find Your Local Tribe', const TribeNetworkScreen()),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Widget screen) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => screen)),
        style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
