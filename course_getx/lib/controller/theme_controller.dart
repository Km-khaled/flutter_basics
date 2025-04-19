import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  final _key = 'isDarkMode';
  final _prefs = Get.find<SharedPreferences>(); // Get SharedPreferences instance

  // Reactive variable for ThemeMode
  late Rx<ThemeMode> themeMode;

  @override
  void onInit() {
    super.onInit();
    // Initialize themeMode based on saved preference or system default
    themeMode = _loadThemeFromPrefs().obs;
    // Apply the saved theme when app starts
    Get.changeThemeMode(themeMode.value);
  }

  // Load theme preference from SharedPreferences
  ThemeMode _loadThemeFromPrefs() {
    bool isDarkMode = _prefs.getBool(_key) ?? false; // Default to light if not set
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  // Save theme preference to SharedPreferences
  Future<void> _saveThemeToPrefs(bool isDarkMode) async {
    await _prefs.setBool(_key, isDarkMode);
  }

  // Switch theme and save preference
  void switchTheme() {
    themeMode.value = themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _saveThemeToPrefs(themeMode.value == ThemeMode.dark);
    Get.changeThemeMode(themeMode.value); // This updates GetMaterialApp
  }
}
