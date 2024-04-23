import 'package:flutter/material.dart';
import 'package:smart_hydro_application/utils/const.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    required this.hintText,
    required this.textInputType,
    required this.textEditingController,
    this.isPass = false,
  });

  final String hintText;
  final TextInputType textInputType;
  final bool isPass;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: Divider.createBorderSide(context,color: Colors.grey, width: 1.0),
      
    );

    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          hintText: hintText,
          border: inputBorder,
          enabledBorder: inputBorder,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
                color: primaryColor,
                width: 1.0), // Customize focused border color
          ),
          filled: true,
          contentPadding: const EdgeInsets.all(8)),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
