import 'package:flutter/material.dart';

class EntryTextField extends StatelessWidget {
  const EntryTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.isObscure,
  });

  final String title;
  final bool isObscure;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscure,
      controller: controller,
      decoration: InputDecoration(labelText: title),
    );
  }
}
