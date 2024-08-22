import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';

class Card2 {
  final String topText;
  final List<String> lines;
  final String buttonText;
  final Color bcolor;
  final Color tcolor;

  Card2({
    required this.topText,
    required this.lines,
    required this.buttonText,
    required this.bcolor,
    required this.tcolor,
  });

  factory Card2.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Card2(
      topText: data['topText'] ?? '',
      lines: List<String>.from(data['lines'] ?? []),
      buttonText: data['buttonText'] ?? '',
      bcolor: Color(int.parse(data['bcolor'] ?? '0xFF482F82')),
      tcolor: Color(int.parse(data['tcolor'] ?? '0xFFFFFFFF')),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'topText': topText,
      'lines': lines,
      'buttonText': buttonText,
      'bcolor': bcolor.value.toRadixString(16),
      'tcolor': tcolor.value.toRadixString(16),
    };
  }
}
