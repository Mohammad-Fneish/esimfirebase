import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  final Rx<String> _currentLanguage = 'en'.obs;

  @override
  void onInit() {
    super.onInit();
    _loadLanguage();
  }

  void changeLanguage(String langCode) {
    Get.updateLocale(Locale(langCode));
    _currentLanguage.value = langCode;
    _saveLanguage();
  }

  bool isEnglish(String languageCode) {
    return languageCode == 'en';
  }

  // Load language from SharedPreferences
  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString('languageCode') ?? 'en';
    Get.updateLocale(Locale(langCode));
    _currentLanguage.value = langCode;
  }

  // Save language to SharedPreferences
  Future<void> _saveLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('languageCode', _currentLanguage.value);
  }

  String get currentLanguage => _currentLanguage.value;
}
