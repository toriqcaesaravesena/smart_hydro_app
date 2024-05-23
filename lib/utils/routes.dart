
import 'package:flutter/material.dart';
import 'package:smart_hydro_application/views/auth/login/login_screen.dart';
import 'package:smart_hydro_application/views/auth/register/register_screen.dart';
import 'package:smart_hydro_application/views/auth/reset%20password/reset_password_screen.dart';
import 'package:smart_hydro_application/views/features/controlling/control_intensitas_cahaya.dart';
import 'package:smart_hydro_application/views/features/controlling/control_nutrisi.dart';
import 'package:smart_hydro_application/views/features/history/history_page.dart';
import 'package:smart_hydro_application/views/features/monitoring/monitor_intensitas_cahaya.dart';
import 'package:smart_hydro_application/views/features/monitoring/monitor_kelembapan_sekitar.dart';
import 'package:smart_hydro_application/views/features/monitoring/monitor_nutrisi.dart';
import 'package:smart_hydro_application/views/features/monitoring/monitor_suhu_air.dart';
import 'package:smart_hydro_application/views/features/monitoring/monitor_suhu_sekitar.dart';
import 'package:smart_hydro_application/views/features/profile/profile.dart';

// Navigator

void goToRegister(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const RegisterScreen()));
}
void goToLogin(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
}
void goToProfile(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const ProfileScreen()));
}
void goToResetPassword(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const ResetPasswordScreen()));
}
void goToControlNutrisi(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const ControlNutrisiScreen()));
}
void goToControlIntensitasCahaya(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const ControlIntensitasCahayaScreen()));
}
void goToMonitorSuhuAir(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const MonitorSuhuAirScreen()));
}
void goToMonitorNutrisi(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const MonitorNutrisiScreen()));
}
void goToMonitorIntensitasCahaya(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const MonitorIntensitasCahayaScreen()));
}
void goToMonitorSuhuSekitar(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const MonitorSuhuSekitarScreen()));
}
void goToMonitorKelembapanSekitar(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const MonitorKelembapanSekitarScreen()));
}
void goToHistoryDataPage (BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const HistoryDataPage()));
}