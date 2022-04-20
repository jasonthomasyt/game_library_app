import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:game_library_app/constants/api_key.dart';
import 'package:game_library_app/features/explore/models/game.dart';

Future<List<Game>> getGames() async {
  try {
    var response = await Dio().get(
      'https://api.rawg.io/api/games',
      queryParameters: {'key': apiKey, 'page_size': 100},
    );

    final decodedResponse = jsonDecode(response.toString())['results'] as List;

    return decodedResponse
        .map((e) => Game.fromJson(e as Map<String, dynamic>))
        .toList();
  } catch (ex) {
    return [];
  }
}
