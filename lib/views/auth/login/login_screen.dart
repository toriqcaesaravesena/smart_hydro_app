import 'package:flutter/material.dart';
import 'package:smart_hydro_application/utils/const.dart';
import 'package:smart_hydro_application/views/auth/register/register_screen.dart';
import 'package:smart_hydro_application/views/shared/input_text_field.dart';
import 'package:smart_hydro_application/services/auth_service.dart';

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

  void loginUser() async {
    String res = await AuthService().loginUser(
        email: _emailController.text, password: _passwordController.text);

    if (res == "success") {}
  }

  void goToRegister() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RegisterScreen(),
      ),
    );
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
                          hintText: "Password",
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
                                  // Handle forgot password logic here
                                  goToResetPassword(context);
                                },
                                child: const Text(
                                  "Forgot Password",
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
                            onPressed: loginUser,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text(
                              "Log In",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            // Corrected: Invoke goToRegister function
                            goToRegister();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: const Text(
                              "Don't have an Account? Sign Up",
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