import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    color: Colors.amber,child: ),
              ),
              
            ],
          )),
    );
  }
}
