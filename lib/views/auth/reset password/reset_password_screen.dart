import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_hydro_application/utils/const.dart';
import 'package:smart_hydro_application/views/shared/input_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}


class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> passwordReset() async {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _emailController.text.trim(),
        );
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: const Text(
                  'Silakan cek email anda!.', textAlign: TextAlign.center,
              ),
              contentTextStyle: const TextStyle(
                  fontFamily: "Lato", fontSize: 18, color: Colors.black),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    goToLogin(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } on FirebaseAuthException catch (e) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Password Reset Failed'),
              content: Text(e.message ?? 'An error occurred'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      child: Image(
                        image: const AssetImage("assets/img/reset_password.png"),
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
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
                          
                          const SizedBox(height: 30),
          
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: passwordReset,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: const Text(
                                "Reset",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 20,
                left: 20,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
