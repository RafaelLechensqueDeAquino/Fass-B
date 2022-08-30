import 'package:flutter/material.dart';
import 'package:silicon_village/module/home/home_page.dart';
import 'package:silicon_village/module/hero/createHero_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sv',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple, primaryColor: Colors.black38),
      initialRoute: "/home",
      routes: {
        "/home": ((context) => const HomePage()),
        "/login": ((context) => const CreateHeroPage())
      },
    );
  }
}
