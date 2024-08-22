import 'package:cloud_firestore/cloud_firestore.dart';

class Card1 {
  final String image;
  final String title;
  final String subtitle;

  Card1({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  factory Card1.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Card1(
      image: data['image'] ?? '',
      title: data['title'] ?? '',
      subtitle: data['subtitle'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'subtitle': subtitle,
    };
  }
}
