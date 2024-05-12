import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_hydro_application/views/auth/login/login_screen.dart';
import 'package:smart_hydro_application/views/auth/register/register_screen.dart';
import 'package:smart_hydro_application/views/auth/reset%20password/reset_password_screen.dart';
import 'package:smart_hydro_application/views/features/controlling/control_intensitas_cahaya.dart';
import 'package:smart_hydro_application/views/features/controlling/control_nutrisi.dart';
import 'package:smart_hydro_application/views/features/monitoring/monitor_intensitas_cahaya.dart';
import 'package:smart_hydro_application/views/features/monitoring/monitor_kelembapan_sekitar.dart';
import 'package:smart_hydro_application/views/features/monitoring/monitor_nutrisi.dart';
import 'package:smart_hydro_application/views/features/monitoring/monitor_suhu_air.dart';
import 'package:smart_hydro_application/views/features/monitoring/monitor_suhu_sekitar.dart';
import 'package:smart_hydro_application/views/features/profile/profile.dart';

// Colors

const Color darkGreenColor = Color(0xFF0EB177);
const Color primaryColor = Color(0xFF40BE73);
const Color secondaryColor = Color(0xFFDCF2E5);
const Color greyColor = Color(0xFFE7E0EC);

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

// SnackBar Notification

showLoginErrorEmail() {
  Get.snackbar(
    "Email not found!","",
    messageText: Text("Please check your email is already sign up",style: TextStyle(fontSize: Get.width * 0.03,color: Colors.white)
    ),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.redAccent,
    snackStyle: SnackStyle.FLOATING,
    duration: const Duration(seconds: 5),
    mainButton: TextButton(
      onPressed: (){
        Get.back();
      },
    child: Text("Ok",style: TextStyle(fontSize: Get.width * 0.035,color: Colors.white)),
    )
  );
}

showLoginErrorPassword() {
  Get.snackbar(
    "Password not found!","",
    messageText: Text("Please check your password is correct",style: TextStyle(fontSize: Get.width * 0.03,color: Colors.white)
    ),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.redAccent,
    snackStyle: SnackStyle.FLOATING,
    duration: const Duration(seconds: 5),
    mainButton: TextButton(
      onPressed: (){
        Get.back();
      },
    child: Text("Ok",style: TextStyle(fontSize: Get.width * 0.035,color: Colors.white)),
    )
  );
}

showLoginErrorEmpty() {
  Get.snackbar(
    "Please Enter All The Fields!","",
    messageText: Text("Please check your form is filled",style: TextStyle(fontSize: Get.width * 0.03,color: Colors.white)
    ),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.redAccent,
    snackStyle: SnackStyle.FLOATING,
    duration: const Duration(seconds: 5),
    mainButton: TextButton(
      onPressed: (){
        Get.back();
      },
    child: Text("Ok",style: TextStyle(fontSize: Get.width * 0.035,color: Colors.white)),
    )
  );
}