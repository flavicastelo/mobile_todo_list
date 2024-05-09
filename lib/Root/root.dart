import 'package:flutter/material.dart';

import 'package:mobile_todo_list/view/pages/home.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "TODO LIST",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: Home()),
      ),
    );
  }
}
