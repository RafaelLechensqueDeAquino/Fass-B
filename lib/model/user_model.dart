import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../shared/base_model.dart';

class UserModel  extends BaseModel{
  final String name;
  final String? photoURL;

  UserModel({required this.name, required this.photoURL});


  

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(name: map['name'], photoURL: map['photoURL']);
  }

  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {"name": name, "photoURL": photoURL};

  String toJson() => jsonEncode(toMap());
  
  @override
  String documentId() {
    // TODO: implement documentId
    throw UnimplementedError();
  }
}
