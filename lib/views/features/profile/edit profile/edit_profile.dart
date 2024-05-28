// ignore_for_file: avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_hydro_application/models/user_model.dart';
import 'package:smart_hydro_application/utils/colors.dart';
import 'package:smart_hydro_application/viewmodels/user_provider.dart';
import 'package:smart_hydro_application/utils/navigation_page.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen(
      {super.key, required this.username, required this.email});

  final String username;
  final String email;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    nameController.text = widget.username;
    emailController.text = widget.email;
    super.initState();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    userModel = Provider.of<UserProvider>(context).getUser;
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide:
          Divider.createBorderSide(context, color: Colors.grey, width: 1.0),
    );

    if (userModel != null) {
      return Scaffold(
          appBar: AppBar(
            title: const Center(
                child: Text("Ubah Akun",
                    style: TextStyle(color: Colors.white))),
            backgroundColor: primaryColor,
            automaticallyImplyLeading: false,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
                child: Stack(
              children: [
                Container(
                  child: Image(
                    image: const AssetImage("assets/img/bg.png"),
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                    child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 80),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage:
                            AssetImage("assets/img/profile_pictures/pp.png"),
                      ),
                    ),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 40, bottom: 5),
                              child: Text("Nama Lengkap",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  hintText: userModel?.username ??
                                      'Masukan nama baru',
                                  border: inputBorder,
                                  enabledBorder: inputBorder,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                        color: primaryColor, width: 1.0),
                                  ),
                                  filled: true,
                                ),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 40, bottom: 5),
                              child: Text("Email",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText:
                                      userModel?.email ?? 'Masukan email baru',
                                  border: inputBorder,
                                  enabledBorder: inputBorder,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                        color: primaryColor, width: 1.0),
                                  ),
                                  filled: true,
                                ),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: OutlinedButton(
                                  onPressed: () {
                                    var currentUser = _auth.currentUser;
                                    if (currentUser != null) {
                                      var updateDataUser = FirebaseFirestore
                                          .instance
                                          .collection('users');
                                      updateDataUser
                                          .doc(currentUser.uid)
                                          .update({
                                        'username': nameController.text,
                                        'email': emailController.text
                                      });
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                const NavigationPage(),
                                          ));
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text('Error'),
                                            content: const Text(
                                                'User tidak terautentikasi.'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    side: const BorderSide(
                                      color: darkGreenColor,
                                    ),
                                  ),
                                  child: const Text(
                                    "    Simpan    ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )),
                            ),
                            const SizedBox(height:15),
                            Center(
                              child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    side: const BorderSide(
                                      color: darkGreenColor,
                                    ),
                                  ),
                                  child: const Text(
                                    "      Batal      ",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  )),
                            )
                          ]),
                    ),
                  ],
                )),
              ],
            )),
          ));
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
