import 'package:flutter/material.dart';
import 'package:custom/colors.dart';
class InputBlank{
  InputBlank(this.text, this.controller, this.obscure);

  String text;
  TextEditingController controller;
  bool obscure;

  Widget build(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        TextField(
          controller: this.controller,
          enableSuggestions: false,
          autocorrect: false,
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
          ),
          cursorColor: Colors.grey.withOpacity(0.8),
          obscureText: obscure,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );

  }
}

Widget ButtonDeco(text, func) {
  return Container(
    margin: const EdgeInsets.fromLTRB(0,23,0,0),
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: TextButton(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: CUSTOMblue, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      onPressed: func,
    ),
  );
}