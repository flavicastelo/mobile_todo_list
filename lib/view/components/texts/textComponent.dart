import 'package:flutter/material.dart';

class TextComponent {
  static Widget textColor(String placeholder, Color color, double size) {
    return Text(
      placeholder,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
      textAlign: TextAlign.center,
    );
  }
}
