import 'package:flutter/material.dart';
import 'package:silicon_village/module/login/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sv',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple, primaryColor: Colors.black38),
      initialRoute: "/login",
      routes: {"/login":((context) => LoginPage())},
    );
  }
}
