import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      constraints: const BoxConstraints.expand(
        width: 300,
        height: 250,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: 300,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
