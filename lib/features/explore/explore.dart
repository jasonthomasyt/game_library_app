import 'package:flutter/material.dart';

import 'package:game_library_app/api/get_games.dart';
import 'package:game_library_app/features/explore/models/game.dart';
import 'package:game_library_app/features/explore/widgets/game_card.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  static const _pageSize = 20;

  final PagingController<int, Game> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((page) {
      _fetchPage(page);
    });
    super.initState();
  }

  Future<void> _fetchPage(int page) async {
    try {
      final newGames = await getGames(page, _pageSize);
      final isLastPage = newGames.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newGames);
      } else {
        final nextPage = page + newGames.length;
        _pagingController.appendPage(newGames, nextPage);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PagedGridView<int, Game>(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Game>(
        itemBuilder: (context, game, index) => GameCard(
          gameId: game.id!,
          title: game.title!,
          imageUrl: game.imageUrl!,
        ),
      ),
    );
  }
}
