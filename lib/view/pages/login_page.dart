// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:mobile_todo_list/routes/enum_routes.dart';
import 'package:mobile_todo_list/routes/routes.dart';
import 'package:mobile_todo_list/utils/theme.dart';
import 'package:mobile_todo_list/view/components/buttons/button.dart';
import 'package:mobile_todo_list/view/components/logo/logo.dart';
import 'package:mobile_todo_list/view/components/texts/subtitle.dart';
import 'package:mobile_todo_list/view/components/texts/textComponent.dart';

import '../components/inputs/inputs.dart';

class LoginPage extends StatefulWidget {
  TextEditingController emailController;
  TextEditingController passController;
  VoidCallback onPressedSend;
  bool changeVisibility;

  LoginPage({
    super.key,
    required this.emailController,
    required this.passController,
    required this.onPressedSend,
    required this.changeVisibility,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Todo List"),
          backgroundColor: myTheme.primaryColor,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Logo.logo(),
                const SizedBox(
                  height: 8,
                ),
                SubTitle.subTitle(),
                const SizedBox(height: 20),
                TextComponent.textColor("LOGIN", myTheme.primaryColor,
                    MediaQuery.of(context).size.height / 20),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      InputLogin.inputTextFieldValidator(
                        widget.emailController,
                        "E-mail",
                        () {},
                        isEmail: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Campo está vazio";
                          }
                          if (value.contains("@") == false) {
                            return "E-mail inválido";
                          }
                          if (value.contains(".") == false) {
                            return "E-mail inválido";
                          }
                          return null;
                        },
                      ),
                      InputLogin.inputTextFieldValidator(
                          widget.passController,
                          "Senha",
                          () {
                            setState(() {
                              widget.changeVisibility =
                                  !widget.changeVisibility;
                            });
                          },
                          isPass: widget.changeVisibility,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Campo está vazio";
                            }
                          }),
                    ],
                  ),
                ),
                ButtonComponent.buttonSend(() {}, "Entrar"),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextComponent.textColor("Ainda não possui uma conta?",
                          myTheme.colorScheme.secondary, 12),
                      ButtonComponent.buttonLink(() {
                        Navigator.push(
                            context,
                            RoutesPages.routesFactory(
                                context: context,
                                routes: ROUTES.register_page));
                      }, "Cadastre-se")
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
