import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:game_library_app/api/get_game_by_id.dart';
import 'package:game_library_app/features/shared/models/game.dart';

class GameDetail extends StatefulWidget {
  const GameDetail({
    Key? key,
    required this.gameId,
    required this.title,
  }) : super(key: key);

  final int gameId;
  final String title;

  @override
  State<GameDetail> createState() => _GameDetailState();
}

class _GameDetailState extends State<GameDetail> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      title: Text(widget.title),
      content: SizedBox(
        width: MediaQuery.of(context).size.width / 1.5,
        height: MediaQuery.of(context).size.height / 1.5,
        child: FutureBuilder<Game>(
          future: getGameByIdFromAPI(widget.gameId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final Game game = snapshot.data as Game;
              final Widget description = Html(data: game.description);
              return Column(
                children: [
                  Expanded(
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        child: description,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var db = FirebaseFirestore.instance;
                      db.collection('games').add({
                        'id': game.id,
                        'name': game.title,
                        'description': game.description,
                        'background_image': game.thumbnail,
                      });
                    },
                    child: const Text('Add To Library'),
                  )
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    ).animate().scale();
  }
}
