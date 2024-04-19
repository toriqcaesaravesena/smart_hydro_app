
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String username;
  final String email;

  const UserModel({
    required this.uid,
    required this.username,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
    "username" : username,
    "uid" : uid,
    "email" : email,
  };

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel (
      uid: snapshot['uid'],
      username: snapshot['username'],
      email: snapshot['email'],
    );
  }
}