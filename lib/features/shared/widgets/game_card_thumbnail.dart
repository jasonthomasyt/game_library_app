import 'package:flutter/material.dart';
import 'package:game_library_app/features/shared/widgets/game_card.dart';
import 'package:game_library_app/features/shared/widgets/game_card_text.dart';

class GameCardThumbnail extends StatelessWidget {
  const GameCardThumbnail({
    Key? key,
    required this.gameCard,
  }) : super(key: key);

  final GameCard gameCard;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(15.0),
      ),
      child: Image.network(
        gameCard.thumbnail,
        fit: BoxFit.cover,
        loadingBuilder: (
          BuildContext context,
          Widget thumbnail,
          ImageChunkEvent? loadingProgress,
        ) {
          return Stack(
            fit: StackFit.expand,
            children: [
              loadingProgress == null
                  ? thumbnail
                  : Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
              GameCardText(
                title: gameCard.title,
              ),
            ],
          );
        },
      ),
    );
  }
}
