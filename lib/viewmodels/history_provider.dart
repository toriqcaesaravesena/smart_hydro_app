import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HistoryMonitorProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<void> addDataSuhuAir(double value, String time) async {
    try {
      User? user = _auth.currentUser;
      if (user == null) {
        throw Exception("No user is signed in");
      }

      String uid = user.uid;
      // Get document reference
      DocumentReference docRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('suhu_air')
          .doc('data');

      // Get existing data or initialize with empty array
      DocumentSnapshot document = await docRef.get();
      List<Map<String, dynamic>> dataList = (document.exists)
          ? List<Map<String, dynamic>>.from(document['data'] ?? [])
          : [];

      // Append new data
      dataList.add({
        'time': time,
        'value': value,
      });

      // Update Firestore with new data
      await docRef.set({'data': dataList});

      log("Data added/updated successfully: value = $value, time = $time");
      notifyListeners();
    } catch (e) {
      log("Error adding data: $e");
    }
      notifyListeners();
  }
}
