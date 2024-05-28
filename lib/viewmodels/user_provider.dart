import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_hydro_application/models/user_model.dart';
import 'package:smart_hydro_application/views/auth/login/login_screen.dart';

class UserProvider with ChangeNotifier {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;
  Stream<User?> get authStateChanges => _auth.authStateChanges();
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

  // Login
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    notifyListeners();
  }

  // Register

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    UserCredential cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    UserModel userModel = UserModel(
      uid: cred.user!.uid,
      email: email,
      username: username,
    );

    await _fireStore.collection("users").doc(cred.user!.uid).set(
          userModel.toJson(),
        );
    notifyListeners();
  }

  // Sign Out User
  Future<void> signOutUser() async {
    await _auth.signOut();
    notifyListeners();
  }
}
