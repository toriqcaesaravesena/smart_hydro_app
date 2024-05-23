import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_hydro_application/models/user_model.dart';
import 'package:smart_hydro_application/utils/notifications.dart';
import 'package:smart_hydro_application/views/auth/login/login_screen.dart';

class UserProvider with ChangeNotifier {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool get isSignedIn => _auth.currentUser != null;

  UserModel? _user;

  UserModel? get getUser => _user;

  Future<UserModel?> getUserDetails() async {
    if (_auth.currentUser != null) {
      User currentUser = _auth.currentUser!;
      DocumentSnapshot snap =
          await _fireStore.collection('users').doc(currentUser.uid).get();
      return UserModel.fromSnap(snap);
    } else {
      log("Tidak ada pengguna yang masuk.");
      return null;
    }
  }

  Future<void> refreshUser() async {
    UserModel? user = await getUserDetails();
    if (user != null) {
      _user = user;
    } else {
      const LoginScreen();
    }
    notifyListeners();
  }

  // Login User
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        showLoginErrorEmpty();
      }
    } catch (e) {
      res = e.toString();
    }
    notifyListeners();
    return res;
  }

  // Register
  Future<String> registerUser({
    required String username,
    required String email,
    required String password,
  }) async {
    String resp = "Some Error occurred";

    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        UserModel userModel = UserModel(
          uid: cred.user!.uid,
          email: email,
          username: username,
        );

        Map<String, dynamic> suhuAirData = {
          'Celsius': 0.0,
        };

        Map<String, int> nutrisiData = {
          'sensor': 0,
        };

        // UserControl nutrisiControl = UserControl(
        //   kontrol: 0,
        // );

        // Add user to database
        await _fireStore.collection("users").doc(cred.user!.uid).set(
              userModel.toJson(),
            );
        await _fireStore
            .collection("users")
            .doc(cred.user!.uid)
            .collection("monitoring")
            .doc("suhu_air")
            .set(suhuAirData);
        await _fireStore
            .collection("users")
            .doc(cred.user!.uid)
            .collection("monitoring")
            .doc("nutrisi")
            .set(nutrisiData);
        // await _fireStore
        //     .collection("users")
        //     .doc(cred.user!.uid)
        //     .collection("controlling")
        //     .doc("nutrisi")
        //     .set(nutrisiControl.toJson());

        resp = "success";
      }
    } catch (e) {
      resp = e.toString();
    }
    return resp;
  }

  // Sign Out User
  Future<void> signOutUser() async {
    await _auth.signOut();
    notifyListeners();
  }
}
