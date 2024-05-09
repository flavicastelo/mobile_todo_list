import 'package:flutter/material.dart';
import 'package:mobile_todo_list/viewController/login_view_controller.dart';
import 'package:mobile_todo_list/viewController/register_view_controller.dart';
import 'enum_routes.dart';

class RoutesPages {
  static MaterialPageRoute routesFactory({
    required BuildContext context,
    required ROUTES routes,
  }) {
    switch (routes) {
      case ROUTES.login_page:
        return MaterialPageRoute(
            builder: (context) => const LoginViewController());
      case ROUTES.register_page:
        return MaterialPageRoute(
            builder: (context) => const RegisterViewController());
      case ROUTES.home_page:
        return MaterialPageRoute(
            builder: (context) => const LoginViewController());
    }
  }
}
