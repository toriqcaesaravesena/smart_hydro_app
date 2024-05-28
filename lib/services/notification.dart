import 'package:flutter/material.dart';
import 'package:smart_hydro_application/utils/colors.dart';

class CustomSnackbarLogin {
  static void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      backgroundColor: primaryColor, // Mengubah warna latar belakang menjadi hijau
      content: Row(
        children: [
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 14), // Mengubah warna teks menjadi putih
            ),
          ),
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Menutup snackbar
            },
            child: const Text(
              'OK',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  static void showSnackBarError(BuildContext context, String message) {
    final snackBar = SnackBar(
      backgroundColor: primaryColor,
      content: Row(
        children: [
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),

        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
