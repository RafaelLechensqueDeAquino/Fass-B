import 'package:flutter/material.dart';
import 'package:silicon_village/module/hero/hero_model.dart';
import 'package:silicon_village/module/hero/hero_repository.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  Widget builderUser(HeroL hero) => ListTile(
        leading: CircleAvatar(child: Text(hero.level.toString())),
        title: Text(hero.name),
        subtitle: Text(hero.birthdayPlayer.toIso8601String())
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: StreamBuilder<List<HeroL>>(
          stream: readHeros(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Algo de errado não esta certo! ${snapshot.error}');
            } else if (snapshot.hasData) {
              final users = snapshot.data!;

              return ListView(children: users.map(builderUser).toList());
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Icon(Icons.add)),
    );
  }
}
