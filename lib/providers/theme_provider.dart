import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final themeProvider = ChangeNotifierProvider.autoDispose(
  (ref) {
    return ThemeNotifier();
  },
);

class ThemeNotifier extends ChangeNotifier {
  bool darkMode = false;

  void enableDarkMode() {
    darkMode = true;
    notifyListeners();
  }

  void enableLightMode() {
    darkMode = false;
    notifyListeners();
  }
}
