
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_hydro_application/models/user_model.dart';
import 'package:smart_hydro_application/utils/const.dart';
// import 'package:smart_hydro_application/services/firebase_api.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  
  Future<String> registerUser({

    required String username,
    required String email,
    required String password,

  }) async {
    String resp = "Some Error occurred";

    try{
       
      if(email.isNotEmpty || password.isNotEmpty || username.isNotEmpty){
        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      
        UserModel userModel = UserModel (
          uid : cred.user!.uid,
          email: email,
          username: username,
        );

        await _fireStore.collection("users").doc(cred.user!.uid).set(userModel.toJson(),);

        resp = "success";
        
      }

    } catch (e) {
      resp = e.toString();
    } 

    return resp;
  }

  Future<String> loginUser ({
    required String email,
    required String password,
  }) async {
    String res = "";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(email: email, password: password);

        res = "success";
      
      }

      else {
        showLoginErrorEmpty();
      }
      
    } catch (e) {
      res = e.toString();
    }

    return res;
  }



  Future<UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap = await _fireStore.collection('users').doc(currentUser.uid).get();
    return UserModel.fromSnap(snap);
  }

}

