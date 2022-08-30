import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:silicon_village/module/login/login_controller.dart';
import 'package:silicon_village/shared/widgets/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final controller = LoginController();
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Tese'),
      ),
      body: ListView(padding: EdgeInsets.all(16), children: <Widget>[
        TextField(
          controller: controllerName,
          decoration: InputDecoration(hintText: 'Name'),
        ),
        const SizedBox(height: 24),
        TextField(
          controller: controllerAge,
          decoration: InputDecoration(hintText: 'age'),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 24),
        DateTimeField(
          controller: controllerDate,
          decoration: InputDecoration(hintText: 'birthday'),
          format: DateFormat('yyyy-MM-dd'),
          onShowPicker: (context, currentValue) {
            return showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));
          },
        ),
        SizedBox(height: 32),
        ElevatedButton(
            onPressed: () {
              final user = User(
                  name: controllerName.text,
                  age: int.parse(controllerAge.text),
                  birthday: DateTime.parse(controllerDate.text));
                createUser(user);

              Navigator.pop(context);
            },
            child: Text('create'))
      ]),
    );
  }

  Future createUser( User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id= docUser.id;

    final json = user.toJson();
    await docUser.set(json);
  }
}

class User {
  String id;
  final String name;
  final int age;
  final DateTime birthday;

  User(
      {this.id = '',
      required this.name,
      required this.age,
      required this.birthday});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'birthday': birthday,
      };
}
