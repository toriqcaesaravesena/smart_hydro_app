
// SnackBar Notification

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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