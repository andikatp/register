// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?) validator;
  const CustomTextfield({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      validator: validator,
    );
  }
}
