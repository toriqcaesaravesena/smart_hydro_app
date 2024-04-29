import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:provider/provider.dart';
import 'package:smart_hydro_application/providers/user_provider.dart';
import 'package:smart_hydro_application/utils/const.dart';
import 'package:smart_hydro_application/views/features/history/history.dart';
import 'package:smart_hydro_application/views/features/profile/profile.dart';
import 'package:smart_hydro_application/views/homepage.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPage();
}

int currentIndex = 1;

class _NavigationPage extends State<NavigationPage> {
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
    userModel = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
        body: const [
          HistoryScreen(),
          HomePage(),
          ProfileScreen(),
        ][currentIndex],
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: primaryColor,
          items: const [
            TabItem(icon: Icons.history, title: 'History'),
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.people, title: 'Profile'),
          ],
          initialActiveIndex: 1,
          onTap: (int i) {
            setState(() {
              currentIndex = i;
            });
          },
        ));
  }
}
