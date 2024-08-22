import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/controllers/cardcontroller.dart'; // Import your controller
import 'package:project1/models/card1model.dart';
import 'package:project1/page_2.dart'; // Import your model

class RecentItemsWidget extends StatelessWidget {
  final String collectionPath;

  const RecentItemsWidget({super.key, required this.collectionPath});

  @override
  Widget build(BuildContext context) {
    // Access CardController instance
    final Cardcontroller cardController = Get.find();

    return Obx(() {
      if (cardController.cards.isEmpty) {
        return Center(child: CircularProgressIndicator());
      }

      final items = cardController.cards.map<Widget>((card) {
        return GestureDetector(
          onTap: () {
            Get.to(const MyTest()); // Navigate to the MyTest screen
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: const BorderSide(
                color: Color(0xFF3E3E40),
              ),
            ),
            color: Theme.of(context).scaffoldBackgroundColor,
            elevation: 4,
            child: ListTile(
              title: Text(
                translate(card.title),
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                translate(card.subtitle),
                style: TextStyle(
                    fontSize: 14, color: Theme.of(context).primaryColor),
              ),
              leading: card.image.isNotEmpty
                  ? ClipOval(
                      child: Image.network(
                        card.image,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    )
                  : null,
              trailing: Icon(
                Get.locale?.languageCode == 'ar'
                    ? Icons.keyboard_arrow_left_outlined
                    : Icons.keyboard_arrow_right_outlined,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        );
      }).toList();

      return Column(
        children: items,
      );
    });
  }

  // Helper function to translate strings
  String translate(String key) {
    return key.tr; // GetX translation helper
  }
}
