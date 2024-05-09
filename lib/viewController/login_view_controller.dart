import 'package:flutter/material.dart';
import 'package:mobile_todo_list/view/pages/login_page.dart';
import 'package:mobile_todo_list/viewModel/login_view_model.dart';

class LoginViewController extends StatefulWidget {
  const LoginViewController({super.key});

  @override
  State<LoginViewController> createState() => _LoginViewControllerState();
}

class _LoginViewControllerState extends State<LoginViewController> {
  late TextEditingController _emailController;
  late TextEditingController _passController;
  late bool changeVisibility;

  @override
  void initState() {
    super.initState();
    changeVisibility = true;
    _emailController = TextEditingController();
    _passController = TextEditingController();
  }

  void loginRequest() async {
    String email = _emailController.text;
    String password = _passController.text;

    // Criar uma instância do LoginViewModel
    LoginViewModel loginViewModel = LoginViewModel();

    // Chamar a função de login do ViewModel
    var result = await loginViewModel.login(email, password);

    // Verificar o resultado da solicitação de login
    if (result['code'] == 'success') {
      // Login bem-sucedido, redirecionar para a próxima página
      // Por exemplo, você pode usar Navigator para navegar para a próxima tela
      Navigator.pushReplacementNamed(context, '/register_page');
    } else {
      // Exibir uma mensagem de erro caso o login falhe
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro de Login'),
          content: Text(result['message']),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoginPage(
      emailController: _emailController,
      passController: _passController,
      changeVisibility: changeVisibility,
      onPressedSend: () {},
    );
  }
}
