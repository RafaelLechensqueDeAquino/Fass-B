import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:silicon_village/module/hero/hero_model.dart';
import 'package:silicon_village/module/hero/hero_repository.dart';

class CreateHeroPage extends StatefulWidget {
  const CreateHeroPage({super.key});

  @override
  State<CreateHeroPage> createState() => CreateHeroPageState();
}

class CreateHeroPageState extends State<CreateHeroPage> {
  // final controller = LoginController();
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tese'),
      ),
      body: ListView(padding: const EdgeInsets.all(16), children: <Widget>[
        TextField(
          controller: controllerName,
          decoration: const InputDecoration(hintText: 'Nome'),
        ),
        const SizedBox(height: 24),
        TextField(
          controller: controllerAge,
          decoration: const InputDecoration(hintText: 'Nivel'),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 24),
        DateTimeField(
          controller: controllerDate,
          decoration: const InputDecoration(hintText: 'anivesario do personagem'),
          format: DateFormat('yyyy-MM-dd'),
          onShowPicker: (context, currentValue) {
            return showDatePicker(
                context: context,
                firstDate: DateTime(1000),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));
          },
        ),
        const SizedBox(height: 32),
        ElevatedButton(
            onPressed: () {
              final hero = HeroL(
                  name: controllerName.text,
                  level: int.parse(controllerAge.text),
                  birthdayPlayer: DateTime.parse(controllerDate.text));
              createHero(hero);

              Navigator.pushNamed(context, '/home');
            },
            child: const Text('create'))
      ]),
    );
  }

  
}


