import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/controllers/language_controller.dart';
import 'package:project1/controllers/theme_controller.dart';

class SettingsPage extends StatelessWidget {
  final LanguageController _languageController = Get.find();

  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final bool isLTR = Get.locale?.languageCode == 'en';

    return Scaffold(
      appBar: AppBar(
        title: Text("settings".tr), // Use translations
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Mode Switcher
            Obx(() {
              final themeMode = themeController.themeMode.value;

              return Row(
                children: <Widget>[
                  Text(
                    "mode".tr, // Use translations
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    "light_mode".tr, // Use translations
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Switch(
                    value: themeMode == ThemeMode.dark,
                    onChanged: (bool value) {
                      themeController.themeMode.value =
                          value ? ThemeMode.dark : ThemeMode.light;
                    },
                  ),
                  const SizedBox(width: 15),
                  Text(
                    "dark_mode".tr, // Use translations
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              );
            }),

            const SizedBox(height: 20),

            // Language Switcher
            Obx(
              () {
                final currentLanguage = _languageController.currentLanguage;

                return Row(
                  children: <Widget>[
                    Text(
                      "language".tr, // Use translations
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      "arabic".tr, // Use translations
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: currentLanguage == 'ar'
                            ? Theme.of(context).primaryColor
                            : null,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Switch(
                      value: currentLanguage == 'en',
                      onChanged: (bool value) {
                        final newLanguage = value ? 'en' : 'ar';
                        _languageController.changeLanguage(newLanguage);
                      },
                    ),
                    const SizedBox(width: 15),
                    Text(
                      "english".tr, // Use translations
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: currentLanguage == 'en'
                            ? Theme.of(context).primaryColor
                            : null,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
