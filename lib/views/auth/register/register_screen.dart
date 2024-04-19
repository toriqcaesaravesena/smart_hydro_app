import 'package:flutter/material.dart';
import 'package:smart_hydro_application/utils/const.dart';
import 'package:smart_hydro_application/views/shared/input_text_field.dart';
import 'package:smart_hydro_application/services/auth_service.dart';

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
    void registerUser() async {
      String resp = await AuthService().registerUser(
          username: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text);

      if (resp == 'success') {
        if (!context.mounted) return;
        goToLogin(context);
      }
    }

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
                        hintText: "Name",
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
                        hintText: "Password",
                        textInputType: TextInputType.text,
                        isPass: true,
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: registerUser,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Text(
                            "Register",
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
                            "Already have an Account? Log In",
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

    // return Scaffold(
    //   body: SafeArea(
    //       child: Container(
    //           padding: const EdgeInsets.symmetric(horizontal: 32),
    //           width: double.infinity,
    //           child: Column(
    //             children: [
    //               Flexible(flex: 2, child: Container()),
    //               InputTextField(
    //                   textEditingController: _nameController,
    //                   hintText: "Name",
    //                   textInputType: TextInputType.text),
    //               const SizedBox(
    //                 height: 24,
    //               ),
    //               InputTextField(
    //                   textEditingController: _emailController,
    //                   hintText: "Email",
    //                   textInputType: TextInputType.emailAddress),
    //               const SizedBox(
    //                 height: 24,
    //               ),
    //               InputTextField(
    //                 textEditingController: _passwordController,
    //                 hintText: "Password",
    //                 textInputType: TextInputType.text,
    //                 isPass: true,
    //               ),
    //               const SizedBox(
    //                 height: 24,
    //               ),
    //               ElevatedButton(onPressed: registerUser, child: const Text("Register")),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Container(
    //                     padding: const EdgeInsets.symmetric(vertical: 8),
    //                     child: const Text("Already have an Account?"),
    //                   ),
    //                   GestureDetector(
    //                     onTap: () {
    //                       goToLogin(context);
    //                     },
    //                     child: Container(
    //                       padding: const EdgeInsets.symmetric(vertical: 10),
    //                       child: const Text(
    //                         "Log In",
    //                         style: TextStyle(fontWeight: FontWeight.bold),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               )
    //             ],
    //           ))),
    // );
  }
}
