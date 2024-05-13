import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_hydro_application/models/user_model.dart';
import 'package:smart_hydro_application/services/auth_service.dart';
import 'package:smart_hydro_application/utils/const.dart';
import 'package:smart_hydro_application/views/auth/login/login_screen.dart';

class UserProvider with ChangeNotifier {
  
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool get isSignedIn => _auth.currentUser != null;

  UserModel? _user;

  // fetch data user
  final AuthService _authService = AuthService();

  UserModel? get getUser => _user;

  Future<void> refreshUser() async {
  UserModel? user = await _authService.getUserDetails();
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

        await _fireStore.collection("users").doc(cred.user!.uid).set(
              userModel.toJson(),
            );
         await _fireStore.collection("users").doc(cred.user!.uid).set(
              userModel.toJson(),);
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
