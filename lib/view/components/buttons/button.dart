import 'package:flutter/material.dart';
import 'package:mobile_todo_list/utils/theme.dart';

class ButtonComponent {
  static Widget buttonSend(VoidCallback onPressed, String placeholder) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(myTheme.primaryColor),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(11)))),
        ),
        child: Text(placeholder),
      ),
    );
  }

  static Widget buttonLink(VoidCallback onPressed, String placeholder) {
    return SizedBox(
      height: 50,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.zero,
          child: Text(
            placeholder,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12,
              color: myTheme.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
