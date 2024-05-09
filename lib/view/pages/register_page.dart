import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mobile_todo_list/routes/enum_routes.dart';
import 'package:mobile_todo_list/routes/routes.dart';
import 'package:mobile_todo_list/utils/theme.dart';
import 'package:mobile_todo_list/view/components/buttons/button.dart';
import 'package:mobile_todo_list/view/components/inputs/inputs.dart';
import 'package:mobile_todo_list/view/components/logo/logo.dart';
import 'package:mobile_todo_list/view/components/texts/subtitle.dart';
import 'package:mobile_todo_list/view/components/texts/textComponent.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController passController;
  TextEditingController verifyPassController;
  VoidCallback onPressedSend;
  bool changeVisibility;
  bool verifyVisibility;

  RegisterPage({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.passController,
    required this.verifyPassController,
    required this.onPressedSend,
    required this.changeVisibility,
    required this.verifyVisibility,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            children: [
              Logo.logo(),
              const SizedBox(
                height: 8,
              ),
              SubTitle.subTitle(),
              const SizedBox(height: 20),
              TextComponent.textColor("CADASTRO", myTheme.primaryColor,
                  MediaQuery.of(context).size.height / 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(children: [
                  InputLogin.inputTextFieldValidator(
                      widget.nameController, "Nome", () {},
                      isPass: false, isEmail: true, validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo está vazio";
                    }
                  }),
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
                          widget.changeVisibility = !widget.changeVisibility;
                        });
                      },
                      isPass: widget.changeVisibility,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Campo está vazio";
                        }
                      }),
                  InputLogin.inputTextFieldValidator(
                      widget.verifyPassController,
                      "Repita a Senha",
                      () {
                        setState(() {
                          widget.verifyVisibility = !widget.verifyVisibility;
                        });
                      },
                      isPass: widget.verifyVisibility,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Campo está vazio";
                        }
                      }),
                ]),
              ),
              ButtonComponent.buttonSend(() {}, "Enviar"),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextComponent.textColor("Já possui uma conta?",
                        myTheme.colorScheme.secondary, 12),
                    ButtonComponent.buttonLink(() {
                      Navigator.push(
                          context,
                          RoutesPages.routesFactory(
                              context: context, routes: ROUTES.login_page));
                    }, "Entre aqui")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
