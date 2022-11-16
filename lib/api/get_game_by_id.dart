import 'package:dio/dio.dart';
import 'package:game_library_app/constants/api_key.dart';
import 'package:game_library_app/features/shared/models/game.dart';

Future<Game> getGameByIdFromAPI(int gameId) async {
  try {
    final response = await Dio().get(
      'https://api.rawg.io/api/games/$gameId',
      queryParameters: {
        'key': apiKey,
      },
    );

    final result = response.data as Map<String, dynamic>;

    return Game.fromJson(result);
  } catch (ex) {
    return Game();
  }
}
