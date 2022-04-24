import 'package:dio/dio.dart';
import 'package:game_library_app/constants/api_key.dart';
import 'package:game_library_app/features/explore/models/game.dart';

Future<List<Game>> getGames(int page, int pageSize) async {
  try {
    final response = await Dio().get(
      'https://api.rawg.io/api/games',
      queryParameters: {
        'key': apiKey,
        'page': page,
        'page_size': pageSize,
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
