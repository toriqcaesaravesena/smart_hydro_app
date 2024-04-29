// ignore_for_file: unused_import

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_hydro_application/models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<UserModel?> getUserDetails() async {
    if (_auth.currentUser != null) {
      User currentUser = _auth.currentUser!;
      DocumentSnapshot snap = await _fireStore.collection('users').doc(currentUser.uid).get();
      return UserModel.fromSnap(snap);
    } else {
      log("Tidak ada pengguna yang masuk.");
      return null;
    }
  }
}
