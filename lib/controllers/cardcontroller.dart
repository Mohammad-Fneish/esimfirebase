import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project1/models/card1model.dart';

class Cardcontroller extends GetxController {
  var cards = <Card1>[].obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchcard();
  }

  Future<void> fetchcard() async {
    try {
      // Get the collection from Firestore and order by the 'indexNumber' field
      CollectionReference cardRef = _firestore.collection('card1');

      // Fetch the documents ordered by 'indexNumber' in ascending order
      QuerySnapshot snapshot = await cardRef
          .orderBy('index',
              descending: false) // Use the index to sort by 'indexNumber'
          .get();

      // Map the documents to AvatarPack model
      List<Card1> packs = snapshot.docs.map((doc) {
        return Card1.fromFirestore(doc);
      }).toList();

      // Update the observable list
      cards.assignAll(packs);
    } catch (e) {
      print('Error fetching avatar packs: $e');
    }
  }
}
