// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_hydro_application/services/notification.dart';
import 'package:smart_hydro_application/utils/colors.dart';
import 'package:smart_hydro_application/utils/routes.dart';
import 'package:smart_hydro_application/viewmodels/user_provider.dart';
import 'package:smart_hydro_application/views/shared/input_text_field.dart';
import 'package:smart_hydro_application/views/auth/login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _registerUser() async {
    if (_isValidEmail(_emailController.text.trim())) {
      try {
        await Provider.of<UserProvider>(context, listen: false)
            .createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          username: _nameController.text.trim(),
        );
        CustomSnackbarLogin.showSnackBar(
            context, "Pendaftaran berhasil! Silakan masuk.");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case 'email-already-in-use':
            CustomSnackbarLogin.showSnackBarError(
                context, "Email sudah digunakan oleh akun lain.");
            break;
          case 'weak-password':
            CustomSnackbarLogin.showSnackBarError(
                context, "Kata Sandi terlalu lemah.");
            break;
          case 'invalid-email':
            CustomSnackbarLogin.showSnackBarError(
                context, "Alamat email tidak valid.");
            break;
          case 'operation-not-allowed':
            CustomSnackbarLogin.showSnackBarError(
                context, "Daftar dengan Email dan Kata Sandi tidak diizinkan.");
            break;
          default:
            CustomSnackbarLogin.showSnackBarError(
                context, '${e.code}: ${e.message}');
        }
      } catch (e) {
        CustomSnackbarLogin.showSnackBarError(
            context, "Terjadi kesalahan: ${e.toString()}");
      }
    } else {
      CustomSnackbarLogin.showSnackBarError(
          context, "Email, Kata Sandi,dan Nama Lengkap tidak boleh kosong!");
    }
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                child: Image(
                  image: const AssetImage("assets/img/register.png"),
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    InputTextField(
                      textEditingController: _nameController,
                      hintText: "Nama Lengkap",
                      textInputType: TextInputType.text,
                    ),
                    const SizedBox(height: 24),
                    InputTextField(
                      textEditingController: _emailController,
                      hintText: "Email",
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 24),
                    InputTextField(
                      textEditingController: _passwordController,
                      hintText: "Kata Sandi",
                      textInputType: TextInputType.text,
                      isPass: true,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _registerUser,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          "Daftar",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        goToLogin(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          "Sudah memiliki akun? Masuk",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: darkGreenColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
