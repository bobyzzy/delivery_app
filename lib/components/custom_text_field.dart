// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.helperText,
    required this.isObscure,
    required this.inputType,
    required this.validator,
    this.prefixWidget,
    this.maxLength,
    this.inputformatter,
  });

  final TextEditingController controller;
  final String label;
  final String hintText;
  final String helperText;
  final bool isObscure;
  final TextInputType inputType;
  final Widget? prefixWidget;
  final int? maxLength;
  final List<TextInputFormatter>? inputformatter;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      inputFormatters: inputformatter,
      controller: controller,
      keyboardType: inputType,
      validator: validator,
      obscureText: isObscure,
      decoration: InputDecoration(
        prefix: prefixWidget,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: const OutlineInputBorder(),
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey.shade400),
        floatingLabelStyle: const TextStyle(color: Colors.black),
        hintText: hintText,
        helperText: helperText,
        helperStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
