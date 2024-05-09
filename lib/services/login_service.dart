import 'dart:convert';

import 'package:mobile_todo_list/requests/login_request.dart';

class LoginService {
  final _loginRequest = LoginRequest();
  Future<Map<String, dynamic>> serviceLogin(
      String email, String password) async {
    final response = await _loginRequest.loginRequest(email, password);
    final responseData = jsonDecode(response.body);
    final userData = responseData['user'];
    switch (response.statusCode) {
      case 200:
        final token = responseData['Token'];
        return {
          "code": "SUCCESS",
          "message": "O login foi efetuado com sucesso!",
          "user": userData,
          "token": token
        };
      case 401:
        return {
          "code": "FAILURE",
          "message": "Login ou senha invalidas, verifique sua senha"
        };
      case 404:
        return {
          "code": "FAILURE",
          "message": "Login ou senha invalidas, verifique sua senha"
        };
    }
    return {
      "code": "FAILURE",
      "message":
          "Falha na internet, verifique sua conecção. Caso o erro pessista entre em contato com a equipe de T.I"
    };
  }
}
