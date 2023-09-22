import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({ this.i ,this.hintText, this.onChanged , this.obscureText =false});
  Function(String)? onChanged;
  String? hintText;
  TextInputType? i;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText:obscureText!,
      onChanged: onChanged,
      keyboardType: i,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
          ),
          borderRadius: BorderRadius.circular(8)
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
          ),
            borderRadius: BorderRadius.circular(8)
        ),
      ),
    );
  }
}