import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mobile_todo_list/view/pages/register_page.dart';

class RegisterViewController extends StatefulWidget {
  const RegisterViewController({super.key});

  @override
  State<RegisterViewController> createState() => _RegisterViewControllerState();
}

class _RegisterViewControllerState extends State<RegisterViewController> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passController;
  late TextEditingController _verifyPassController;
  late bool changeVisibility;
  late bool verifyVisibility;

  @override
  void initState() {
    super.initState();
    changeVisibility = true;
    verifyVisibility = true;
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passController = TextEditingController();
    _verifyPassController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return RegisterPage(
      nameController: _nameController,
      emailController: _emailController,
      passController: _passController,
      verifyPassController: _verifyPassController,
      changeVisibility: changeVisibility,
      verifyVisibility: verifyVisibility,
      onPressedSend: () {},
    );
  }
}
