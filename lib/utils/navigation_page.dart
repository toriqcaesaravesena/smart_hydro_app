import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:smart_hydro_application/utils/const.dart';
import 'package:smart_hydro_application/views/features/profile/profile.dart';
import 'package:smart_hydro_application/views/homepage.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPage();
}

int currentIndex = 0;

class _NavigationPage extends State<NavigationPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: const [
          HomePage(),
          ProfileScreen(),
        ][currentIndex],
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: primaryColor,
          items: const [
            TabItem(icon: Icons.home, title: 'Beranda'),
            TabItem(icon: Icons.people, title: 'Profil'),
          ],
          initialActiveIndex: 0,
          onTap: (int i) {
            setState(() {
              currentIndex = i;
            });
          },
        ));
  }
}
