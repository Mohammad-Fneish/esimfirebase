import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/controllers/cardcontroller.dart';
import 'package:project1/controllers/theme_controller.dart';
import 'package:project1/controllers/language_controller.dart';
import 'package:project1/home.dart';
import 'package:project1/translations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyC8qw-UrzUM4X4yzvDdimFb7dcwTFlJC44",
          appId: "1:247620725342:android:45f6481f8c44e9c721e2cf",
          messagingSenderId: "247620725342",
          projectId: "esimapp-4ac79",
          storageBucket: "esimapp-4ac79.appspot.com"));

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  firestore.settings = const Settings(persistenceEnabled: false);
  final themeController = Get.put(ThemeController());
  final languageController = Get.put(LanguageController());
  final cardController = Get.put(Cardcontroller());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final LanguageController languageController = Get.find();
    final Cardcontroller cardController = Get.find();

    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: Get.deviceLocale,
        fallbackLocale: Locale('en') ?? Locale('en'),
        translations: AppTranslations(),
        theme: themeController.lightTheme,
        darkTheme: themeController.darkTheme,
        themeMode: themeController.themeMode.value,
        home: MyHomePage(),
      );
    });
  }
}
