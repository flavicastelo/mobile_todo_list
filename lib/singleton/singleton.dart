import '../database/database.dart';

class SingletonLocalStorage {
  late LocalStorageDB _localStorageDB;
  static SingletonLocalStorage? _instance;

  SingletonLocalStorage._() {
    _localStorageDB = LocalStorageDB(keys: "Users");
  }

  factory SingletonLocalStorage() {
    if (_instance == null) {
      _instance = SingletonLocalStorage._();
    }
    return _instance!;
  }

  LocalStorageDB get localStorageDB => _localStorageDB;
}
