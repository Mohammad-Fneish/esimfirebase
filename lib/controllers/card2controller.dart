import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project1/models/card2model.dart';

class Card2Controller extends GetxController {
  var cards = <Card2>[].obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchCards();
  }

  Future<void> fetchCards() async {
    try {
      CollectionReference cardRef = _firestore.collection('card2');

      QuerySnapshot snapshot = await cardRef
          .orderBy('index', descending: false) // Adjust if needed
          .get();

      List<Card2> fetchedCards = snapshot.docs.map((doc) {
        return Card2.fromFirestore(doc);
      }).toList();

      cards.assignAll(fetchedCards);
    } catch (e) {
      print('Error fetching card2 documents: $e');
    }
  }
}
