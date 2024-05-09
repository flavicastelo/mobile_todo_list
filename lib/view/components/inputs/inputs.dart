import 'package:flutter/material.dart';
import 'package:mobile_todo_list/utils/theme.dart';

class InputLogin {
  static Widget inputTextFieldValidator(TextEditingController controller,
      String placeholder, VoidCallback changeVisibility,
      {dynamic validator, bool isPass = false, bool isEmail = false}) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Stack(children: [
        TextFormField(
          textAlign: TextAlign.start,
          controller: controller,
          obscureText: isPass,
          textAlignVertical: isEmail ? null : TextAlignVertical.center,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 15),
            suffixIcon: isEmail
                ? null
                : IconButton(
                    color: myTheme.primaryColor,
                    icon:
                        Icon(isPass ? Icons.visibility_off : Icons.visibility),
                    onPressed: changeVisibility,
                  ),
            hintText: placeholder,
          ),
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        )
      ]),
    );
  }
}
