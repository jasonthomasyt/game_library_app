import 'package:flutter/material.dart';
import 'package:game_library_app/api/get_games.dart';
import 'package:game_library_app/features/library/models/game.dart';
import 'package:game_library_app/features/library/widgets/game_card.dart';

class Library extends StatelessWidget {
  const Library({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none ||
            snapshot.data == null) {
          return const CircularProgressIndicator();
        }

        final games = snapshot.data! as List<Game>;

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: games.length,
          itemBuilder: (context, index) {
            final Game game = games[index];
            return GameCard(title: game.title!, imageUrl: game.image!);
          },
        );
      },
      future: getGames(),
    );
  }
}
