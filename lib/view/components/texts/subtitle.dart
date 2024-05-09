import 'package:flutter/material.dart';
import 'package:mobile_todo_list/utils/theme.dart';

class SubTitle {
  static Widget subTitle() {
    return Text(
      "Organize sua vida com a ajuda de um to-do list simples e eficiente",
      style: TextStyle(
        color: myTheme.colorScheme.secondary,
      ),
      textAlign: TextAlign.center,
    );
  }
}
