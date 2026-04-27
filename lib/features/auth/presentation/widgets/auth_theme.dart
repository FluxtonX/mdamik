import 'package:flutter/material.dart';

class AuthTheme {
  static const Color orange = Color(0xFFF28B22);
  static const Color orangeDark = Color(0xFFE57E2E);
  static const Color surface = Colors.white;
  static const Color border = Color(0xFFE9E9EE);

  static const LinearGradient headerGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [orange, orangeDark],
  );
}

