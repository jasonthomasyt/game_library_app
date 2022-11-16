import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:game_library_app/extensions/build_context_extensions.dart';
import 'package:game_library_app/features/shared/widgets/game_card.dart';
import 'package:game_library_app/firestore/get_games_from_firestore.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../shared/models/game.dart';

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
          return const Center(child: CircularProgressIndicator());
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
            DocumentSnapshot game = snapshot.data!.docs[index];
            return GameCard(
              gameId: game['id'],
              title: game['name'],
              imageUrl: game['background_image'],
            );
          },
        );
      },
    );
  }
}
