import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/retribe_provider.dart';

class IRLQuestsScreen extends StatelessWidget {
  const IRLQuestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ReTribeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('IRL Quests')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Complete real-world actions to grow your Synapse Garden',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                provider.completeIRLAction();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Quest completed! Garden grew 🌱')),
                );
              },
              child: const Text('I just had a genuine 5-min conversation'),
            ),
            const SizedBox(height: 20),
            const Text('Other quests coming soon: empathy walk, phone-free storytelling, etc.'),
          ],
        ),
      ),
    );
  }
}
