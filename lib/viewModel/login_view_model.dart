import 'package:mobile_todo_list/services/login_service.dart';
import 'package:mobile_todo_list/singleton/singleton.dart';

class LoginViewModel {
  LoginViewModel();

  final _serviceLogin = LoginService();
  SingletonLocalStorage instanceDB = SingletonLocalStorage();
  Future<dynamic> login(String email, String pass) async {
    try {
      final responseLogin = await _serviceLogin.serviceLogin(email, pass);

      if (responseLogin['code'] == "SUCCESS") {
        final token = responseLogin['token'];
        final user = responseLogin['user'];
        final userObject = user(
          id: user['_id'],
          name: user['name'],
          email: user['email'],
        );
        instanceDB.localStorageDB.setUser(userObject.userFromMap(userObject));

        instanceDB.localStorageDB.setToken(token);

        return {
          "code": "success",
        };
      } else {
        return responseLogin;
      }
    } catch (e) {
      return {
        "code": "UNDEFINED_ERROR",
        "message": "Falha ao logar, verifique seu login e sua senha",
        "erro": e,
      };
    }
  }
}
