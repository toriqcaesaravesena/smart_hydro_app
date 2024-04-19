import 'package:flutter/material.dart';
import 'package:smart_hydro_application/views/auth/login/login_screen.dart';
import 'package:smart_hydro_application/views/auth/register/register_screen.dart';
import 'package:smart_hydro_application/views/auth/reset%20password/reset_password_screen.dart';
import 'package:smart_hydro_application/views/features/profile/profile.dart';

const Color darkGreenColor = Color(0xFF0EB177);
const Color primaryColor = Color(0xFF40BE73);
const Color secondaryColor = Color(0xFFDCF2E5);

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
