import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:game_library_app/extensions/build_context_extensions.dart';
import 'package:game_library_app/features/shared/models/game.dart';
import 'package:game_library_app/features/shared/widgets/game_card.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('games')
          .orderBy('name')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.isMobile
                ? 2
                : context.isTablet
                    ? 3
                    : 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot document = snapshot.data!.docs[index];
            final Game game = Game(
              id: document['id'],
              title: document['name'],
              description: document['description'],
              thumbnail: document['background_image'],
            );

            return GameCard(
              gameId: game.id!,
              title: game.title!,
              thumbnail: game.thumbnail!,
            );
          },
        );
      },
    );
  }
}
