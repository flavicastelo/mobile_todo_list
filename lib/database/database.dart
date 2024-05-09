import 'package:localstorage/localstorage.dart';

class LocalStorageDB {
  late LocalStorage _localStorage;

  LocalStorageDB({required String keys}) {
    _localStorage = LocalStorage(keys);
  }

  Future<Map<String, dynamic>> setToken(String token) async {
    try {
      await _localStorage.setItem("TOKEN", token);
      return {"code": "SUCCESS", "MESSAGE": "Token salvo com sucesso!"};
    } catch (e) {
      return {
        "code": "FAILURE",
        "MESSAGE": "Falha ao salvar o token!",
        "error": e.toString()
      };
    }
  }

  Future<Map<String, dynamic>> setUser(Map<String, dynamic> user) async {
    try {
      await _localStorage.setItem("User", user);
      return {"code": "SUCCESS", "MESSAGE": "Usuário salvo com sucesso!"};
    } catch (e) {
      return {
        "code": "FAILURE",
        "MESSAGE": "Falha ao salvar o usuário!",
        "error": e.toString()
      };
    }
  }

  Future<Map<String, dynamic>> setValue(
      {required String key, required dynamic value}) async {
    try {
      await _localStorage.setItem(key, value);
      return {"code": "SUCCESS", "MESSAGE": "Salvo com sucesso!"};
    } catch (err) {
      return {"code": "FAILURE", "MESSAGE": err.toString()};
    }
  }

  dynamic getValue({required String key}) {
    try {
      return _localStorage.getItem(key);
    } catch (err) {
      return {"code": "FAILURE", "MESSAGE": err.toString()};
    }
  }

  dynamic getToken() {
    try {
      return _localStorage.getItem("TOKEN");
    } catch (err) {
      return {"code": "FAILURE", "MESSAGE": err.toString()};
    }
  }

  dynamic getUser() {
    try {
      return _localStorage.getItem("User");
    } catch (err) {
      return {"code": "FAILURE", "MESSAGE": err.toString()};
    }
  }

  Future<Map<String, dynamic>> removeToken() async {
    try {
      await _localStorage.deleteItem('TOKEN');
      return {"code": "SUCCESS", "MESSAGE": "Token removido com sucesso!"};
    } catch (err) {
      return {"code": "FAILURE", "MESSAGE": err.toString()};
    }
  }

  Future<Map<String, dynamic>> removeUser() async {
    try {
      await _localStorage.deleteItem('User');
      return {"code": "SUCCESS", "MESSAGE": "Usuário removido com sucesso!"};
    } catch (err) {
      return {"code": "FAILURE", "MESSAGE": err.toString()};
    }
  }
}
