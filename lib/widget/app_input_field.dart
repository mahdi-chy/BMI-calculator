import 'package:flutter/material.dart';

class AppInputFieldstyle extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType? textInputType;
  const AppInputFieldstyle({
    super.key,
    required this.labelText,
    required this.controller,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Color.fromARGB(202, 255, 82, 30)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: const Color.fromARGB(96, 255, 158, 128),
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.deepOrange, width: 1),
        ),
      ),
    );
  }
}
