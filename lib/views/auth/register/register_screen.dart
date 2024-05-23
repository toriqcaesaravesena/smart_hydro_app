// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  @override
  Widget build(BuildContext context) {
    final provider = context.read<UserProvider>();

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
                          onPressed: () async {
                              String resp = await provider.registerUser(
                                  username: _nameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text);

                              if (resp == 'success') {
                                const LoginScreen();
                              }
                          },
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
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
