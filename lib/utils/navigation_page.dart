import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:smart_hydro_application/utils/colors.dart';
import 'package:smart_hydro_application/views/features/profile/profile.dart';
import 'package:smart_hydro_application/views/homepage.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPage();
}

class _NavigationPage extends State<NavigationPage> {
  get bottomNavigationBar => null;

  int selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List pages = [
    const HomePage(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: ConvexAppBar(
            backgroundColor: primaryColor,
            items: const [
              TabItem(icon: Icons.home, title: 'Beranda'),
              TabItem(icon: Icons.people, title: 'Akun'),
            ],
            initialActiveIndex: 0,
            onTap: navigateBottomBar));
  }
}
