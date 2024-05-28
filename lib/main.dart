// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:smart_hydro_application/firebase_options.dart';
import 'package:smart_hydro_application/utils/navigation_page.dart';
import 'package:smart_hydro_application/viewmodels/control_provider.dart';
import 'package:smart_hydro_application/viewmodels/history_provider.dart';
import 'package:smart_hydro_application/viewmodels/monitoring_provider.dart';
import 'package:smart_hydro_application/viewmodels/time_provider.dart';
import 'package:smart_hydro_application/viewmodels/user_provider.dart';
import 'package:smart_hydro_application/views/auth/login/login_screen.dart';
import 'package:smart_hydro_application/services/user_wrapper_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => TimeProvider()),
          ChangeNotifierProvider(create: (_) => ControlProvider()),
          ChangeNotifierProvider(create: (_) => MonitorProvider()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Smart Hydro',
          home: Wrapper(),
        ));
  }
}
