import 'package:flutter/material.dart';

class TextFormFieldwidget extends StatelessWidget {
  const TextFormFieldwidget({
    super.key,
    required this.obscureText,
    required this.hintText,
    this.validator,
    this.controller,
    this.suffixIcon,
  });

  final bool obscureText;
  final String hintText;
  final dynamic validator;
  final dynamic controller;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white, fontSize: 23),
        errorStyle: const TextStyle(fontSize: 16),
      ),
    );
  }
}
