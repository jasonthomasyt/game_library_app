import 'package:dio/dio.dart';
import 'package:game_library_app/constants/api_key.dart';
import 'package:game_library_app/features/shared/models/game.dart';

Future<List<Game>> getGamesFromAPI(int page, int pageSize,
    {String? search}) async {
  try {
    final response = await Dio().get(
      'https://api.rawg.io/api/games',
      queryParameters: {
        'key': apiKey,
        'page': page,
        'page_size': pageSize,
        'search': search,
        'exclude_stores': '9',
        'exclude_additions': true,
      },
    );

    final results = (response.data as Map<String, dynamic>)['results'] as List;

    return results
        .map((e) => Game.fromJson(e as Map<String, dynamic>))
        .toList();
  } catch (ex) {
    return [];
  }
}
