import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {

  bool isGpuChecked = true;
  bool isCpuChecked = true;
  bool isMemoryChecked = true;
  bool isFpsChecked = true;

  void setGpuChecked(value) {
    isGpuChecked = value;
    notifyListeners();
  }

  void setCpuChecked(value) {
    isCpuChecked = value;
    notifyListeners();
  }

  void setMemoryChecked(value) {
    isMemoryChecked = value;
    notifyListeners();
  }

  void setFpsChecked(value) {
    isFpsChecked = value;
    notifyListeners();
  }
}