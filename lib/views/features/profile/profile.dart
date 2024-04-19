import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_hydro_application/models/user_model.dart';
import 'package:smart_hydro_application/providers/user_provider.dart';

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
  
  UserModel? userModel;

  @override
  Widget build(BuildContext context) {

    userModel = Provider.of<UserProvider>(context).getUser;

    if(userModel != null) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Profile")),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(onPressed: () async {
          await FirebaseAuth.instance.signOut();
        }, icon: const Icon(Icons.logout))
      ],),
      body: Center(child: Text(userModel!.username),),
    );
    }

    else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
