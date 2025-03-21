


import 'package:flutter/material.dart';

class CustomFormFeild extends StatefulWidget {
  CustomFormFeild({
    super.key,
    required this.title,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.errorText,
    this.isPass = false,
  });

  String title;
  TextInputType? keyboardType;
  TextEditingController? controller;
  bool obscureText;
  String? errorText;
  void Function(String)? onChanged;
  bool isPass;

  @override
  State<CustomFormFeild> createState() => _CustomFormFeildState();
}

class _CustomFormFeildState extends State<CustomFormFeild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        suffixIcon: widget.isPass?InkWell(
          child: widget.obscureText? Icon(Icons.visibility) : Icon(Icons.visibility_off),
          onTap: ()=> setState(() {
            widget.obscureText = ! widget.obscureText;
          }),
        ):null,
        errorText: widget.errorText,
        label: Text(widget.title),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}