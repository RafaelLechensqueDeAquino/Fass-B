import 'package:cloud_firestore/cloud_firestore.dart';

class HeroL {
  String id;
  final String name;
  final int level;
  final DateTime birthdayPlayer;

  HeroL(
      {this.id = '',
      required this.name,
      required this.level,
      required this.birthdayPlayer});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'level': level,
        'birthdayPlayer': birthdayPlayer,
      };

  static HeroL fromJson(Map<String, dynamic> json) => HeroL(
      name: json['name'],
      level: json['level'],
      birthdayPlayer: (json['birthdayPlayer'] as Timestamp).toDate());
}
