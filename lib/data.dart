import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

import 'package:flutter/material.dart';

const String testJsonData = '''
[
  {
    "image": "https://img.icons8.com/?size=48&id=5RQ-CeHHQ8Lk&format=png",
    "title": "saudi_arabia_title",
    "subtitle": "saudi_arabia_subtitle"
  },
  {
    "image": "https://img.icons8.com/?size=48&id=jznUVWNe3XQx&format=png",
    "title": "jordan_title",
    "subtitle": "jordan_subtitle"
  },
  {
    "image": "https://img.icons8.com/?size=48&id=p1VTmNRxfZuT&format=png",
    "title": "uae_title",
    "subtitle": "uae_subtitle"
  },
  {
    "image": "https://img.icons8.com/?size=48&id=OC1ufLkYV6dO&format=png",
    "title": "iraq_title",
    "subtitle": "iraq_subtitle"
  },
  {
    "image": "https://img.icons8.com/?size=48&id=7VwKIiIiHg2x&format=png",
    "title": "syria_title",
    "subtitle": "syria_subtitle"
  },
  {
    "image": "https://img.icons8.com/?size=48&id=sbsb8Sz7qBRn&format=png",
    "title": "turkey_title",
    "subtitle": "turkey_subtitle"
  },
  {
    "image": "https://img.icons8.com/?size=48&id=zFOCbkMd5a6c&format=png",
    "title": "yemen_title",
    "subtitle": "yemen_subtitle"
  },
  {
    "image": "https://img.icons8.com/?size=48&id=w9iFGpNCBpDg&format=png",
    "title": "cyprus_title",
    "subtitle": "cyprus_subtitle"
  },
  {
    "image": "https://img.icons8.com/?size=48&id=q40F3Pnubh6o&format=png",
    "title": "bahrain_title",
    "subtitle": "bahrain_subtitle"
  },
  {
    "image": "https://img.icons8.com/?size=48&id=KeF1pMOP3luC&format=png",
    "title": "georgia_title",
    "subtitle": "georgia_subtitle"
  },
  {
    "image": "https://img.icons8.com/?size=48&id=ly7tzANRt33n&format=png",
    "title": "spain_title",
    "subtitle": "spain_subtitle"
  },
  {
    "image": "https://img.icons8.com/?size=48&id=esGVrxg9VCJ1&format=png",
    "title": "india_title",
    "subtitle": "india_subtitle"
  },
  {
    "image": "https://img.icons8.com/?size=48&id=suxQg9He2_m5&format=png",
    "title": "switzerland_title",
    "subtitle": "switzerland_subtitle"
  },
  {
    "image": "https://img.icons8.com/?size=48&id=McQbrq9qaQye&format=png",
    "title": "japan_title",
    "subtitle": "japan_subtitle"
  }
]
''';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final List<dynamic> data = jsonDecode(testJsonData);

  final firestore = FirebaseFirestore.instance;
  final collectionRef = firestore.collection('countries');

  for (var item in data) {
    await collectionRef.add(item);
  }

  print("Data uploaded successfully!");
}
