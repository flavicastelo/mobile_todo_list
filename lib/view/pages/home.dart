import 'package:flutter/material.dart';
import 'package:mobile_todo_list/viewController/login_view_controller.dart';

import 'login_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: LoginViewController());
  }
}
