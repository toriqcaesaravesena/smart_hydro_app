// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_hydro_application/services/notification.dart';
import 'package:smart_hydro_application/utils/colors.dart';
import 'package:smart_hydro_application/utils/routes.dart';
import 'package:smart_hydro_application/viewmodels/user_provider.dart';
import 'package:smart_hydro_application/views/shared/input_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signInWithEmailAndPassword() async {
  if (_emailController.text.trim().isEmpty && _passwordController.text.trim().isEmpty) {
    CustomSnackbarLogin.showSnackBarError(context, "Email dan Kata Sandi tidak boleh kosong!");
  } else if (_emailController.text.trim().isEmpty) {
    CustomSnackbarLogin.showSnackBarError(context, "Email tidak boleh kosong!");
  } else if (_passwordController.text.trim().isEmpty) {
    CustomSnackbarLogin.showSnackBarError(context, "Kata Sandi tidak boleh kosong!");
  } else if (_isValidEmail(_emailController.text.trim())) {
    try {
      await UserProvider().signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-disabled':
          CustomSnackbarLogin.showSnackBarError(context, "Akun anda dinonaktifkan oleh administrator");
          break;
        case 'channel-error':
          CustomSnackbarLogin.showSnackBarError(context, "Data tidak boleh kosong!");
          break;
        case 'user-not-found':
          CustomSnackbarLogin.showSnackBarError(context, "Email yang anda masukkan tidak terdaftar sebagai pengguna");
          break;
        case 'too-many-requests':
          CustomSnackbarLogin.showSnackBarError(context, "Terlalu banyak permintaan, coba lagi nanti");
          break;
        case 'network-request-failed':
          CustomSnackbarLogin.showSnackBarError(context, "Terdapat kesalahan dalam jaringan, coba lagi nanti");
          break;
        case 'invalid-credential':
          CustomSnackbarLogin.showSnackBarError(context, "Alamat email dan kata sandi yang anda masukan salah");
          break;
        default:
          CustomSnackbarLogin.showSnackBarError(context, '${e.code}: ${e.message}');
      }
    }
  } else {
    CustomSnackbarLogin.showSnackBarError(context, "Email Tidak Terdaftar");
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
                    image: const AssetImage("assets/img/login.png"),
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
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
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  goToResetPassword(context);
                                },
                                child: const Text(
                                  "Lupa Kata Sandi",
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            // onPressed: loginUser,
                            onPressed: _signInWithEmailAndPassword,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text(
                              "Masuk",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            goToRegister(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: const Text(
                              "Belum memiliki akun? Daftar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: darkGreenColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      );
  }
}
