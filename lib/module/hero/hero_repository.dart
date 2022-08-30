import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:silicon_village/module/hero/hero_model.dart';

Future createHero(HeroL hero) async {
    final docHero = FirebaseFirestore.instance.collection('heros').doc();
    hero.id = docHero.id;

    final json = hero.toJson();
    await docHero.set(json);
  }

  Stream<List<HeroL>> readHeros() => FirebaseFirestore.instance
      .collection('heros')
      .snapshots()
      .map((event) => event.docs.map((e) => HeroL.fromJson(e.data())).toList());