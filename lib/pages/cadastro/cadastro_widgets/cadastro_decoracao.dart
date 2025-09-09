import 'package:flutter/material.dart';

InputDecoration InputDecorationCadastro(String label) {
  return InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelText: label,
    fillColor: const Color.fromARGB(0, 255, 255, 255),
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
    hintStyle: TextStyle(color: const Color.fromARGB(255, 255, 133, 63)),
    labelStyle: TextStyle(color: const Color.fromARGB(255, 255, 133, 63)),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: const Color.fromARGB(255, 255, 146, 4),
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 255, 145, 0),
        width: 2,
      ),
    ),
  );
}

CorLetras() {
  return TextStyle(color: const Color.fromARGB(255, 244, 146, 54));
}
