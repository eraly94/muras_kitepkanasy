import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final Widget icon;


  const MyTextField(
      {super.key,
      required this.controller,
      required this.icon,
      required this.labelText,
      this.hintText,
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: controller,
          
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            
            hintText: hintText,
            labelText: labelText,
            prefixIcon: icon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
