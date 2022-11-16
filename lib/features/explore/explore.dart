import 'package:flutter/material.dart';

import 'package:game_library_app/api/get_games.dart';
import 'package:game_library_app/extensions/build_context_extensions.dart';
import 'package:game_library_app/features/shared/models/game.dart';
import 'package:game_library_app/features/shared/widgets/game_card.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  static const _pageSize = 20;
  final TextEditingController _searchController = TextEditingController();

  final PagingController<int, Game> _pagingController =
      PagingController(firstPageKey: 1);

  String? _search = '';

  @override
  void initState() {
    _pagingController.addPageRequestListener((page) {
      _fetchPage(page);
    });
    _searchController.addListener(() {
      setState(() {
        _search = _searchController.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int page) async {
    try {
      final newGames = await getGamesFromAPI(page, _pageSize, search: _search);
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              hintText: 'Search for games',
              prefixIcon: Icon(Icons.search),
            ),
            textInputAction: TextInputAction.search,
            onSubmitted: (value) {
              _pagingController.refresh();
            },
            onChanged: (_) {
              _pagingController.refresh();
            },
          ),
        ),
        Expanded(
          child: PagedGridView<int, Game>(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.isMobile
                  ? 2
                  : context.isTablet
                      ? 3
                      : 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Game>(
              itemBuilder: (context, game, index) => GameCard(
                gameId: game.id!,
                title: game.title!,
                imageUrl: game.thumbnail!,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
