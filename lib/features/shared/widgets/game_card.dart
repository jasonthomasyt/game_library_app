import 'package:flutter/material.dart';
import 'package:game_library_app/features/shared/widgets/game_card_thumbnail.dart';
import 'package:game_library_app/features/shared/widgets/game_details/game_detail.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GameCard extends ConsumerStatefulWidget {
  const GameCard({
    Key? key,
    required this.gameId,
    required this.title,
    required this.thumbnail,
  }) : super(key: key);

  final int gameId;
  final String title;
  final String thumbnail;

  @override
  GameCardState createState() => GameCardState();
}

class GameCardState extends ConsumerState<GameCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          BoxShadow(
            // ignore: avoid_redundant_argument_values
            color: Colors.black,
            spreadRadius: isHover ? 5.0 : 0.0,
            blurRadius: 6.0,
          ),
        ],
      ),
      child: InkWell(
        onTap: () async {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return GameDetail(
                gameId: widget.gameId,
                title: widget.title,
              );
            },
          );
        },
        onHover: (val) {
          setState(() {
            isHover = val;
          });
        },
        child: GameCardThumbnail(gameCard: widget),
      ),
    );
  }
}
