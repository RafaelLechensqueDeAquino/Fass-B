import 'package:flutter/material.dart';
import 'package:silicon_village/module/login/login_controller.dart';
import 'package:silicon_village/shared/widgets/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Center(
                  child: Container(
                width: size.width,
                height: size.height * 0.4,
                color: Colors.amber,
                child: const Padding(
                    padding: EdgeInsets.only(
                        left: 40, bottom: 40, right: 40, top: 40),
                    child: SocialLoginButton()),
              )),
            ],
          )),
    );
  }
}
