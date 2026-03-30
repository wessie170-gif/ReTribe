import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReTribeProvider extends ChangeNotifier {
  int gardenLevel = 0;
  bool screenTimeWarning = false;
  int offlineMinutes = 0;

  ReTribeProvider() {
    _loadProgress();
  }

  void completeIRLAction() {
    gardenLevel = (gardenLevel + 10).clamp(0, 100);
    notifyListeners();
    _saveProgress();
  }

  void triggerScreenTimeWarning() {
    screenTimeWarning = true;
    notifyListeners();
  }

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    gardenLevel = prefs.getInt('gardenLevel') ?? 0;
    notifyListeners();
  }

  Future<void> _saveProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('gardenLevel', gardenLevel);
  }
}
