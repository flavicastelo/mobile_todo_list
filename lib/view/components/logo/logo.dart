import 'package:flutter/material.dart';
import '../../../utils/theme.dart';

class Logo {
  static Widget logo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "FLAV",
          style: TextStyle(
            color: myTheme.primaryColor,
            fontSize: 50,
          ),
        ),
        Text(
          "LIST",
          style: TextStyle(
            color: myTheme.colorScheme.secondary,
            fontSize: 50,
          ),
        ),
      ],
    );
  }
}
