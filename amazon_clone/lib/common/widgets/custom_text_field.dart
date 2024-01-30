import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black38,
      ),
    );
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        border: border,
        enabledBorder: border,
      ),
      validator: (value) {},
    );
  }
}
