import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obsceure;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obsceure
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        filled: true,
        fillColor: const Color(0xffF5F6FA),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      obscureText: widget.obsceure,
    );
  }
}