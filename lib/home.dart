import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/bar.dart';
import 'package:project1/controllers/bottom_nav_controller.dart';
import 'package:project1/controllers/home_controller.dart';
import 'package:project1/controllers/theme_controller.dart';
import 'package:project1/setting.dart';
import 'card_1.dart';
import 'data.dart';
import 'package:project1/controllers/language_controller.dart';

class MyHomePage extends StatelessWidget {
  final LanguageController _languageController = Get.find();
  final Rx<String> _currentLanguage = 'en'.obs;

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavController());
    final HomeController homeController = Get.put(HomeController());
    final ThemeController themeController = Get.find();
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          automaticallyImplyLeading: false,
          title: Text(
            "hello".tr,
            style: TextStyle(
              fontSize: 26,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  child: CircleAvatar(
                    backgroundColor: const Color(0xFF3E3E43),
                    child: IconButton(
                      icon: const Icon(Icons.settings,
                          color: Color.fromARGB(255, 156, 139, 139)),
                      onPressed: () {
                        Get.to(SettingsPage());
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: CircleAvatar(
                    backgroundColor: const Color(0xFF3E3E43),
                    child: IconButton(
                      icon: const Icon(Icons.notifications,
                          color: Color.fromARGB(255, 156, 139, 139)),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
                        offset: const Offset(0.0, -5.0),
                        blurRadius: 8,
                      ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(0.0, -10.0),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  height: 135,
                  width: 340,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              margin: const EdgeInsets.only(
                                  left: 15, top: 13, bottom: 13, right: 9),
                              height: 109,
                              width: 30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.network(
                                  'https://www.deepbuenosaires.com.ar/gallery_gen/80f1e8ee2891e2ed722eef152d354dac_992x558.30342577488.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 9),
                              height: 109,
                              width: 30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(
                                  'assets/my_image.png.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 9),
                              height: 109,
                              width: 30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.network(
                                  'https://i.pinimg.com/736x/fc/a5/ba/fca5ba2b71a7f5ccd170306dba219e61.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 9),
                              height: 109,
                              width: 30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(
                                  'assets/Weimar.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 94,
                              width: 155,
                              child: Text(
                                'data_plans'.tr,
                                style: const TextStyle(
                                  color: Color(0xFF040505),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(text: 'starting_at'.tr),
                                      const TextSpan(
                                        text: ' \$3 ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(text: 'per_day'.tr),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xFF4DD965),
                                  size: 16,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF3E3E43),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Obx(() {
                          final selectedButtonIndex =
                              homeController.selectedButtonIndex.value;
                          final labels = [
                            'country'.tr,
                            'regional'.tr,
                            'global'.tr
                          ];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(labels.length, (index) {
                              return Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: () => homeController
                                      .setSelectedButtonIndex(index),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: (selectedButtonIndex == index)
                                            ? const Color(0xFF707070)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(
                                            (selectedButtonIndex == index)
                                                ? 20
                                                : 0)),
                                    padding: const EdgeInsets.all(15),
                                    child: Text(
                                      labels[index],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 40,
                  width: 340,
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      hintText: "search_hint".tr,
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.3),
                      ),
                      filled: true,
                      fillColor: const Color(0xFF313131),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 21,
                  width: 340,
                  child: Text(
                    'popular_countries'.tr,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const RecentItemsWidget(
                  collectionPath: 'card1',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
