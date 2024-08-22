import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/bar.dart';
import 'package:project1/card_2.dart';
import 'package:project1/home.dart';

class MyTest extends StatefulWidget {
  const MyTest({super.key});
  @override
  State<MyTest> createState() => _MyTestState();
}

class _MyTestState extends State<MyTest> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: false,
        leading: Row(
          children: [
            const SizedBox(
              width: 6,
            ),
            InkWell(
              child: Icon(
                Get.locale?.languageCode == 'ar'
                    ? Icons.keyboard_arrow_right_outlined
                    : Icons.keyboard_arrow_left_outlined,
                color: Theme.of(context).primaryColor,
              ),
              onTap: () {
                Get.to(MyHomePage());
              },
            ),
          ],
        ),
        leadingWidth: 30,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipOval(
              child: Image.network(
                'https://img.icons8.com/?size=48&id=5RQ-CeHHQ8Lk&format=png',
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'saudi_arabia_title'.tr,
              style: TextStyle(
                fontSize: 26,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(25),
          children: const [
            CustomCardWidget(
              topText: '\$4.5',
              lines: ['Saudi Arabia', '1 GB', '7 Days'],
              buttonText: 'buy_now',
              bcolor: Color.fromARGB(255, 86, 64, 138),
              tcolor: Colors.white,
            ),
            CustomCardWidget(
              topText: '\$7.0',
              lines: ['Saudi Arabia', '2 GB', '15 Days'],
              buttonText: 'buy_now',
              bcolor: Color.fromARGB(255, 86, 64, 138),
              tcolor: Colors.white,
            ),
            CustomCardWidget(
              topText: '\$9.5',
              lines: ['Saudi Arabia', '5 GB', '30 Days'],
              buttonText: 'buy_now',
              bcolor: Color.fromARGB(255, 86, 64, 138),
              tcolor: Colors.white,
            ),
            CustomCardWidget(
              topText: '\$13.0',
              lines: ['Saudi Arabia', '7 GB', '30 Days'],
              buttonText: 'buy_now_free',
              bcolor: Color.fromARGB(255, 204, 204, 190),
              tcolor: Color(0xFF2A2A2A),
            ),
          ],
        ),
      ),
    );
  }
}
