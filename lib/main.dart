import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/neuron_forge.dart';     // Daily reprogramming
import 'screens/irl_quests.dart';      // Real-world challenges
import 'screens/tribe_network.dart';   // Belonging pods
import 'providers/retribe_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://YOUR-SUPABASE-URL.supabase.co', // Create free project at supabase.com in 2 min
    anonKey: 'YOUR-ANON-KEY',
  );
  runApp(const ReTribeApp());
}

class ReTribeApp extends StatelessWidget {
  const ReTribeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ReTribeProvider(),
      child: MaterialApp(
        title: 'ReTribe',
        theme: ThemeData.dark().copyWith(primaryColor: Colors.teal),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ReTribeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('ReTribe — Reclaim Humanity')),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text('Your Synapse Garden: ${provider.gardenLevel} 🌱', style: const TextStyle(fontSize: 24)),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NeuronForgeScreen())),
            child: const Text('Daily Neuron Forge (10 min)'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const IRLQuestsScreen())),
            child: const Text('IRL Quests — Step Into Life'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TribeNetworkScreen())),
            child: const Text('Find Your Tribe (IRL pods)'),
          ),
          if (provider.screenTimeWarning) const Text('Screen time high — App features locked until 30 min offline ❤️', style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
