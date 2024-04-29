import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_hydro_application/models/user_model.dart';
import 'package:smart_hydro_application/providers/user_provider.dart';
import 'package:smart_hydro_application/utils/const.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  @override
  void initState() {
    updateData();
    super.initState();
  }

  updateData() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
  }
  


  @override
  Widget build(BuildContext context) {
    UserModel? userModel = Provider.of<UserProvider>(context).getUser;

    if (userModel != null) {
      return Scaffold(
          appBar: AppBar(
            title: const Center(
                child: Text("Profile", style: TextStyle(color: Colors.white))),
            backgroundColor: primaryColor,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  onPressed: () async {
                    await Provider.of<UserProvider>(context, listen: false).signOutUser();
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ))
            ],
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
                            AssetImage("assets/img/profile_pictures/pp.jpg"),
                      ),
                    ),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 40, bottom: 5),
                              child: Text("Full Name",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey)),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  width: 350,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: primaryColor, width: 1)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Text(
                                      userModel!.username,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 20),
                                    ),
                                  ),
                                )),
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
                                child: Container(
                                  width: 350,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: primaryColor, width: 1)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Text(
                                      userModel!.email,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 20),
                                    ),
                                  ),
                                )),
                            const SizedBox(height: 20,),
                            Center(
                              child: OutlinedButton(
                                  onPressed: () {
                                    goToEditProfile(context);
                                  },
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    side: const BorderSide(
                                      color: darkGreenColor,
                                    ),
                                  ),
                                  child: const Text(
                                    "        Edit        ",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
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
