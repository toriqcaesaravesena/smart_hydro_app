
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_hydro_application/providers/user_provider.dart';
import 'package:smart_hydro_application/views/auth/login/login_screen.dart';
import 'package:smart_hydro_application/views/homepage.dart';


class SmartHydro extends StatefulWidget {
  const SmartHydro({super.key, required this.title});

  final String title;

  @override
  State<SmartHydro> createState() => _SmartHydroState();
}

class _SmartHydroState extends State<SmartHydro> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider(),),],
      child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const NavigationPage();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              }
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return const LoginScreen();
          }),
    );
  }
}

