import 'package:flutter/material.dart';
import 'package:game_library_app/features/explore/models/game.dart';
import 'package:game_library_app/features/explore/widgets/game_card_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GameCard extends ConsumerStatefulWidget {
  const GameCard({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  final String title;
  final String imageUrl;

  _GameCardState createState() => _GameCardState();
}

class _GameCardState extends ConsumerState<GameCard> {
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
        onTap: () {},
        onHover: (val) {
          setState(() {
            isHover = val;
          });
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          ),
          child: Image.network(
            widget.imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (
              BuildContext context,
              Widget image,
              ImageChunkEvent? loadingProgress,
            ) {
              if (loadingProgress == null) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    image,
                    GameCardText(
                      title: widget.title,
                    ),
                  ],
                );
              }

              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
        ),
        // child: GameCardText(
        //   title: widget.title,
        // ),
      ),
    );
  }
}
