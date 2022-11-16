import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:game_library_app/features/shared/models/game.dart';

Future<List<Game>> getGamesFromFirestore() async {
  var db = FirebaseFirestore.instance;
  var games = await db.collection('games').get();
  return games.docs.map((e) => Game.fromJson(e.data())).toList()
    ..sort((a, b) => a.title!.compareTo(b.title!));
}
